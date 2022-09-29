import 'dart:async';
import 'dart:collection';

import 'package:booking_hotel/data/model/facility_mode.dart';
import 'package:booking_hotel/data/model/hotel_model.dart';
import 'package:booking_hotel/data/model/param_models/hotel_query_param_model.dart';
import 'package:booking_hotel/data/repository/hotel/hotel_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final HotelRepository hotelRepository;
  bool isEng = true;

  static HotelCubit get(context) => BlocProvider.of(context);

  HotelCubit({required this.hotelRepository}) : super(HotelInitialState());

  void updateAppLang(bool isEnglish) {
    isEng = isEnglish;
    emit(HotelInitialState());
  }

  /// common
  final int count = 5;

  /// home
  ScrollController? homeListC;
  List<HotelModel> homeHotels = [];
  int homeTotalPages = 0;
  int homeHotelsPage = 1;

  /// search
  final searchC = TextEditingController();
  final Completer<GoogleMapController> controller = Completer();
  var markers = HashSet<Marker>();
  late CameraPosition initialPosition;
  int searchHotelsPage = 1;
  int searchTotalPages = 0;
  int currentLayoutIndex = 0;
  int searchType = 0;
  ScrollController? searchListC;
  bool showSearchTypes = false;
  bool showSearchBar = true;
  List<FacilityModel> facilities = [];
  List<HotelModel> searchHotels = [];
  RangeValues? priceRangeFilter;
  List<FacilityModel>? facilityListFilter;
  double? distanceFilter;
  LatLng? myLocation;

  onLogoutReset() {
    /// home
    homeListC = null;
    homeHotels.clear();
    homeTotalPages = 0;
    homeHotelsPage = 1;

    /// search
    markers.clear();
    searchHotelsPage = 1;
    searchTotalPages = 0;
    currentLayoutIndex = 0;
    searchType = 0;
    searchListC = null;
    showSearchTypes = false;
    showSearchBar = true;
    facilities.clear();
    searchHotels.clear();
    priceRangeFilter = null;
    facilityListFilter = null;
    distanceFilter = null;
    myLocation = null;
    emit(HotelUpdateCubitState());
  }

  Future initHomeScreen() async {
    if (homeHotels.isNotEmpty) {
      homeHotels.clear();
    }
    homeHotelsPage = 1;
    homeTotalPages = 0;
    homeListC ??= ScrollController();
    homeListC!.addListener(_homeListScrollListener);
    emit(HotelUpdateCubitState());
    await getHotels();
  }

  _homeListScrollListener() {
    if (homeListC!.position.pixels > 0 &&
        homeListC!.position.atEdge &&
        homeHotelsPage < homeTotalPages) {
      homeHotelsPage++;
      getHotels(true);
    }
  }

  getHotels([bool update = false]) async {
    if (!update) {
      homeHotelsPage = 1;
    }
    emit(GetHotelsLoadingState());
    final param = HotelQueryParamsModel(count: count, page: homeHotelsPage);
    final result = await hotelRepository.getHotels(
        hotelQueryParamsModel: param, isEng: isEng);
    result.fold((l) {
      emit(GetHotelsLoadingErrorState(l));
    }, (r) {
      if (!update) {
        homeHotels.clear();
      }
      homeHotels.addAll(r.hotels);
      homeTotalPages = r.lastPage;
      emit(GetHotelsLoadedState());
    });
  }

  Future initSearchScreen() async {
    searchHotelsPage = 1;
    searchTotalPages = 0;
    currentLayoutIndex = 0;
    searchType = 0;
    showSearchTypes = false;
    showSearchBar = true;
    if (facilities.isNotEmpty) {
      facilities.clear();
    }
    if (searchHotels.isNotEmpty) {
      searchHotels.clear();
    }
    searchListC ??= ScrollController();
    searchListC!.addListener(_searchListScrollListener);
    final param = HotelQueryParamsModel(
      count: count,
      page: searchHotelsPage,
      facilities: facilityListFilter != null
          ? facilityListFilter!.map((e) => "${e.id}").toList()
          : null,
      minPrice: priceRangeFilter != null ? priceRangeFilter!.start : null,
      maxPrice: priceRangeFilter != null ? priceRangeFilter!.end : null,
      distance: distanceFilter,
      latitude: distanceFilter != null ? myLocation!.latitude : null,
      longitude: distanceFilter != null ? myLocation!.longitude : null,
    );
    emit(HotelUpdateCubitState());
    await _getFacilities();
    await _searchHotels(param);
    await getMyLocation();
  }

  _searchListScrollListener() {
    if (searchListC!.position.pixels > 0 && searchListC!.position.atEdge) {
      searchHotelsPage++;
      final param = HotelQueryParamsModel(
        count: 5,
        page: searchHotelsPage,
        name: searchType == 0 && searchC.text.isNotEmpty ? searchC.text : null,
        address:
            searchType == 1 && searchC.text.isNotEmpty ? searchC.text : null,
        facilities: facilityListFilter != null
            ? facilityListFilter!.map((e) => "${e.id}").toList()
            : null,
        minPrice: priceRangeFilter != null ? priceRangeFilter!.start : null,
        maxPrice: priceRangeFilter != null ? priceRangeFilter!.end : null,
        distance: distanceFilter,
        latitude: distanceFilter != null ? myLocation!.latitude : null,
        longitude: distanceFilter != null ? myLocation!.longitude : null,
      );
      if (searchHotelsPage <= searchTotalPages) {
        _searchHotels(param, true);
      }
    }
  }

  void toggleSearchBar() {
    showSearchBar = !showSearchBar;
    emit(HotelUpdateCubitState());
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
    emit(HotelUpdateCubitState());
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
    emit(HotelUpdateCubitState());
  }

  void updateFilterData(
    RangeValues? price,
    double? distance,
    List<FacilityModel>? selectedFacilityList,
  ) {
    searchHotelsPage = 1;
    facilityListFilter = selectedFacilityList;
    distanceFilter = distance;
    priceRangeFilter = price;
    emit(HotelUpdateCubitState());
    final param = HotelQueryParamsModel(
      count: count,
      page: searchHotelsPage,
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
    if (markers.isNotEmpty) {
      markers.clear();
    }
    if (myLocation != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('-1'),
          position: myLocation!,
        ),
      );
    }
    for (int i = 0; i < searchHotels.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId('${searchHotels[i].id}'),
          position: LatLng(
            searchHotels[i].latitude,
            searchHotels[i].longitude,
          ),
        ),
      );
    }
    emit(HotelUpdateCubitState());
  }

  void toggleCurrentExploreLayout() {
    if (currentLayoutIndex == 0) {
      currentLayoutIndex = 1;
    } else {
      currentLayoutIndex = 0;
    }
    emit(HotelUpdateCubitState());
  }

  void toggleSearchTypes() {
    showSearchTypes = !showSearchTypes;
    emit(HotelUpdateCubitState());
  }

  void updateSelectedSearchType(int? value) {
    searchType = value!;
    emit(HotelUpdateCubitState());
  }

  void search() {
    searchHotelsPage = 1;
    FocusManager.instance.primaryFocus?.unfocus();
    final param = HotelQueryParamsModel(
      count: count,
      page: searchHotelsPage,
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
    final result = await hotelRepository.getFacilities(isEng: isEng);
    result.fold((l) {
      emit(GetFacilitiesLoadingErrorState(l));
    }, (r) {
      facilities.clear();
      facilities.addAll(r.facilities);
      emit(GetFacilitiesLoadedState());
    });
  }

  Future _searchHotels(
    HotelQueryParamsModel paramsModel, [
    bool update = false,
  ]) async {
    emit(SearchHotelsLoadingState());
    final result = await hotelRepository.searchHotels(
        hotelQueryParamsModel: paramsModel, isEng: isEng);
    result.fold((l) {
      emit(SearchHotelsLoadingErrorState(l));
    }, (r) {
      if (!update) {
        searchHotels.clear();
      }
      searchHotels.addAll(r.hotels);
      searchTotalPages = r.lastPage;
      emit(SearchHotelsLoadedState());
    });
  }
}
