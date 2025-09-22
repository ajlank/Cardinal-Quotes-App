import 'dart:convert';

WallPaperModel wallpaperModelFromJson(String str) => WallPaperModel.fromJson(json.decode(str));

String wallpaperModelToJson(WallPaperModel data) => json.encode(data.toJson());

class WallPaperModel {
    final id;
    final String status;
    final List<WallPaperData> data;

    WallPaperModel({
        required this.id,
        required this.status,
        required this.data,
    });

    factory WallPaperModel.fromJson(Map<String, dynamic> json) => WallPaperModel(
        status: json["status"],
        data: List<WallPaperData>.from(json["data"].map((x) => WallPaperData.fromJson(x))),
        id:json["id"]
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "id":id
    };
}


WallPaperData wallDataFromJson(String str) => WallPaperData.fromJson(json.decode(str));

String wallDataToJson(WallPaperData data) => json.encode(data.toJson());

class WallPaperData {
    final int id;
    final String imagePath;
    final int viewCount;
    final List<String> keywords;

    WallPaperData({

        required this.id,
        required this.imagePath,
        required this.viewCount,
        required this.keywords,
    });

    factory WallPaperData.fromJson(Map<String, dynamic> json) => WallPaperData(
        id: json["id"],
        imagePath: json["image_path"],
        viewCount: json["view_count"],
        keywords: List<String>.from(json["keywords"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image_path":imagePath,
        "view_count": viewCount,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
    };
}
