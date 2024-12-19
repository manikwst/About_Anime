// To parse this JSON data, do
//
//     final modeldatanime = modeldatanimeFromJson(jsonString);

import 'dart:convert';

Map<String, Modeldatanime> modeldatanimeFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, Modeldatanime>(k, Modeldatanime.fromJson(v)));

String modeldatanimeToJson(Map<String, Modeldatanime> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Modeldatanime {
  String imageUrl;
  String smallImageUrl;
  String largeImageUrl;

  Modeldatanime({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory Modeldatanime.fromJson(Map<String, dynamic> json) => Modeldatanime(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
        largeImageUrl: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
        "large_image_url": largeImageUrl,
      };
}
