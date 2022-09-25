import 'dart:async';
import 'dart:collection';
import 'package:booking_hotel/data/models/hotel_data/hotel.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';
import 'package:booking_hotel/data/models/hotel_search_models_response/hotel_model.dart';
import 'package:booking_hotel/data/models/hotel_search_param_model/search_hotel_params_model.dart';
import 'package:booking_hotel/data/repository/explore/explore_repository.dart';
import 'package:booking_hotel/data/repository/hotels/hotels_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final ExploreRepository exploreRepository;

  List<FacilityModel> facilities = [];
  List<HotelModel> searchHotels = [];

  final searchC = TextEditingController();
  final listC = ScrollController();
  int page = 1;
  int searchType = 0;
  bool showSearchTypes = false;
  RangeValues? priceRangeFilter;
  List<FacilityModel>? facilityListFilter;
  double? distanceFilter;
  int currentLayoutIndex = 0;
  late CameraPosition initialPosition;
  LatLng? myLocation;
  final Completer<GoogleMapController> controller = Completer();
  var markers = HashSet<Marker>();
  bool showSearchBar = false;

  ExploreCubit({
    required this.exploreRepository,
  }) : super(ExploreInitial()) {
    _initCubit();
  }

  static ExploreCubit get(BuildContext context) => BlocProvider.of(context);

  Future _initCubit() async {
    listC.addListener(_listScrollListener);
    final param = SearchHotelParamsModel(
      count: 5,
      page: 1,
      facilities: facilityListFilter != null
          ? facilityListFilter!.map((e) => "${e.id}").toList()
          : null,
      minPrice: priceRangeFilter != null ? priceRangeFilter!.start : null,
      maxPrice: priceRangeFilter != null ? priceRangeFilter!.end : null,
      distance: distanceFilter,
      latitude: distanceFilter != null ? myLocation!.latitude : null,
      longitude: distanceFilter != null ? myLocation!.longitude : null,
    );
    await _getFacilities();
    await _searchHotels(param);
    await getMyLocation();
  }

  _listScrollListener() {
    if (listC.position.pixels > 0 && listC.position.atEdge) {
      page++;
      final param = SearchHotelParamsModel(
        count: 5,
        page: page,
        name: searchC.text,
        facilities: facilityListFilter != null
            ? facilityListFilter!.map((e) => "${e.id}").toList()
            : null,
        minPrice: priceRangeFilter != null ? priceRangeFilter!.start : null,
        maxPrice: priceRangeFilter != null ? priceRangeFilter!.end : null,
        distance: distanceFilter,
        latitude: distanceFilter != null ? myLocation!.latitude : null,
        longitude: distanceFilter != null ? myLocation!.longitude : null,
      );
      _searchHotels(param, true);
    }
  }

  @override
  Future<void> close() {
    listC.dispose();
    return super.close();
  }

  void toggleSearchBar() {
    showSearchBar = !showSearchBar;
    emit(ExploreUpdateUIState());
  }

  Future<void> getMyLocation() async {
    Location.instance.requestPermission();
    Location.instance.requestService();
    LocationData locationData = await Location.instance.getLocation();
    myLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );
    initialPosition = CameraPosition(
      target: myLocation!,
      zoom: 12,
    );
    markers.add(
      Marker(
        markerId: const MarkerId("-1"),
        position: myLocation!,
      ),
    );
    emit(ExploreUpdateUIState());
  }

  Future<void> goToNewPosition(double lat, double lon) async {
    final GoogleMapController mapController = await controller.future;
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            lat,
            lon,
          ),
          zoom: 12,
        ),
      ),
    );
    emit(ExploreUpdateUIState());
  }

  void updateFilterData(
    RangeValues? price,
    double? distance,
    List<FacilityModel>? selectedFacilityList,
  ) {
    facilityListFilter = selectedFacilityList;
    distanceFilter = distance;
    priceRangeFilter = price;
    emit(ExploreUpdateUIState());
    final param = SearchHotelParamsModel(
      count: 5,
      page: 1,
      facilities: facilityListFilter != null
          ? facilityListFilter!.map((e) => "${e.id}").toList()
          : null,
      minPrice: priceRangeFilter != null ? priceRangeFilter!.start : null,
      maxPrice: priceRangeFilter != null ? priceRangeFilter!.end : null,
      distance: distanceFilter,
      latitude: distanceFilter != null ? myLocation!.latitude : null,
      longitude: distanceFilter != null ? myLocation!.longitude : null,
    );
    _searchHotels(param);
  }

  void onCreateMap(GoogleMapController c) {
    controller.complete(c);
    for (int i = 0; i < searchHotels.length; i++) {
      markers.add(Marker(
        markerId: MarkerId('${searchHotels[i].id}'),
        position: LatLng(
          searchHotels[i].latitude,
          searchHotels[i].longitude,
        ),
      ));
    }
    emit(ExploreUpdateUIState());
  }

  void toggleCurrentExploreLayout() {
    if (currentLayoutIndex == 0) {
      currentLayoutIndex = 1;
    } else {
      currentLayoutIndex = 0;
    }
    emit(ExploreUpdateUIState());
  }

  void toggleSearchTypes() {
    showSearchTypes = !showSearchTypes;
    emit(ExploreUpdateUIState());
  }

  void updateSelectedSearchType(int? value) {
    searchType = value!;
    emit(ExploreUpdateUIState());
  }

  void search() {
    page = 1;
    FocusManager.instance.primaryFocus?.unfocus();
    final param = SearchHotelParamsModel(
      count: 5,
      page: page,
      name: searchType == 0 ? searchC.text : null,
      address: searchType == 1 ? searchC.text : null,
      facilities: facilityListFilter != null
          ? facilityListFilter!.map((e) => "${e.id}").toList()
          : null,
      minPrice: priceRangeFilter != null ? priceRangeFilter!.start : null,
      maxPrice: priceRangeFilter != null ? priceRangeFilter!.end : null,
      distance: distanceFilter,
      latitude: distanceFilter != null ? myLocation!.latitude : null,
      longitude: distanceFilter != null ? myLocation!.longitude : null,
    );
    _searchHotels(param);
  }

  Future _getFacilities() async {
    emit(GetFacilitiesLoadingState());
    final result = await exploreRepository.getFacilities();
    result.fold((l) {
      emit(GetFacilitiesLoadingErrorState(l));
    }, (r) {
      facilities.clear();
      facilities.addAll(r);
      emit(GetFacilitiesLoadedState());
    });
  }

  Future _searchHotels(
    SearchHotelParamsModel paramsModel, [
    bool update = false,
  ]) async {
    if (!update) {
      searchHotels.clear();
    }
    emit(SearchHotelsLoadingState());
    final result = await exploreRepository.searchHotels(
      searchHotelParamsModel: paramsModel,
    );
    result.fold((l) {
      emit(SearchHotelsLoadingErrorState(l));
    }, (r) {
      searchHotels.addAll(r);
      emit(SearchHotelsLoadedState());
    });
  }
}
