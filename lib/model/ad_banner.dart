import 'dart:convert';

import 'package:hive/hive.dart';

part 'ad_banner.g.dart';

List<AdBanner> adBannerListFromJson(String str) {
  final jsonData = json.decode(str);
  if (jsonData == null || jsonData['data'] == null) {
    return [];
  }
  return List<AdBanner>.from(jsonData['data'].map((x) => AdBanner.fromJson(x)));
}

@HiveType(typeId: 1)
class AdBanner {
  @HiveField(0)
  int id;
  @HiveField(1)
  String imageUrl;

  AdBanner({
    required this.id,
    required this.imageUrl,
  });

  factory AdBanner.fromJson(Map<String, dynamic> json) => AdBanner(
        id: json["id"],
        imageUrl: json["attributes"]["image"]["data"]["attributes"]["url"],
      );
}
