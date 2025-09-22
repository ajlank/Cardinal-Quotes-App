
import 'dart:convert';

SoundsModel soundsModelFromJson(String str) => SoundsModel.fromJson(json.decode(str));

String soundsModelToJson(SoundsModel data) => json.encode(data.toJson());

class SoundsModel {
  final String status;
  final List<Data> data;

  SoundsModel({
    required this.status,
    required this.data,
  });

  factory SoundsModel.fromJson(Map<String, dynamic> json) => SoundsModel(
        status: json["status"] ?? "error",
        data: List<Data>.from(json["data"]?.map((x) => Data.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.map((x) => x.toJson()).toList(),
      };
}


List<Data> dataFromJson(String str) => List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String dataToJson(List<Data> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Data {
  final int id;
  final String? name;
  final String? imgPath;
  final String? audioPath;
  final int viewCount;
  final List<String> keywords;

  Data({
    required this.id,
    this.name,
    this.imgPath,
    this.audioPath,
    required this.viewCount,
    required this.keywords,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"] as String?,
        imgPath: json["img_path"] as String?,
        audioPath: json["audio_path"] as String?,
        viewCount: json["view_count"] ?? 0,
        keywords: List<String>.from(json["keywords"] ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name ?? "",
        "img_path": imgPath ?? "",
        "audio_path": audioPath ?? "",
        "view_count": viewCount,
        "keywords": keywords,
      };
}
