import 'dart:convert';

class PoiDomainModel {
  final String id;
  final String title;
  final String latitude;
  final String longitude;
  final String image;

  PoiDomainModel({
    required this.id,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.image,
  });

  PoiDomainModel copyWith({
    String? id,
    String? title,
    String? latitude,
    String? longitude,
    String? image,
  }) =>
      PoiDomainModel(
        id: id ?? this.id,
        title: title ?? this.title,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        image: image ?? this.image,
      );

  factory PoiDomainModel.fromRawJson(String str) => PoiDomainModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PoiDomainModel.fromJson(Map<String, dynamic> json) {
    final splitGeo = json['geocoordinates'].toString().split(",");
    final latitude = splitGeo[0];
    final longitude = splitGeo[1];
    return PoiDomainModel(
      id: json["id"],
      title: json["title"],
      latitude: latitude,
      longitude: longitude,
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "geocoordinates": '$latitude,$longitude',
    "image": image,
  };
}
