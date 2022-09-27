class HotelImages {
  int? id;
  String? hotelId;
  String? image;
  String? createdAt;
  String? updatedAt;

  HotelImages(
      {this.id, this.hotelId, this.image, this.createdAt, this.updatedAt});

  HotelImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hotel_id'] = hotelId;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
