import 'dart:convert';

List<SleepSoundsModel> sleepSoundsModelFromJson(String str) => List<SleepSoundsModel>.from(json.decode(str).map((x) => SleepSoundsModel.fromJson(x)));

String sleepSoundsModelToJson(List<SleepSoundsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SleepSoundsModel {
    final String image;
    final String title;
    final List<String> tags;
    final String views;

    SleepSoundsModel({
        required this.image,
        required this.title,
        required this.tags,
        required this.views,
    });

    factory SleepSoundsModel.fromJson(Map<String, dynamic> json) => SleepSoundsModel(
        image: json["image"],
        title: json["title"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        views: json["views"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "views": views,
    };
}
