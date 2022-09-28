class HotelQueryParamsModel {
  final String? name;
  final String? address;
  final double? maxPrice;
  final double? minPrice;
  final List<String>? facilities;
  final double? latitude;
  final double? longitude;
  final double? distance;
  final int count;
  final int page;

  const HotelQueryParamsModel({
    this.name,
    this.address,
    this.maxPrice,
    this.minPrice,
    this.facilities,
    this.latitude,
    this.longitude,
    this.distance,
    required this.count,
    required this.page,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'count': count,
      'page': page,
    };
    if (name != null) {
      map['name'] = name;
    }
    if (address != null) {
      map['address'] = address;
    }
    if (maxPrice != null) {
      map['max_price'] = maxPrice;
    }
    if (minPrice != null) {
      map['min_price'] = minPrice;
    }
    if (facilities != null) {
      for (int i = 0; i < facilities!.length; i++) {
        map['facilities[$i]'] = facilities![i];
      }
    }
    if (latitude != null) {
      map['latitude'] = latitude;
    }
    if (longitude != null) {
      map['longitude'] = longitude;
    }
    if (distance != null) {
      map['distance'] = distance;
    }
    return map;
  }
}
