import 'dart:convert';

List<TopQuotesModel> sleepSoundsModelFromJson(String str) => List<TopQuotesModel>.from(json.decode(str).map((x) => TopQuotesModel.fromJson(x)));

String sleepSoundsModelToJson(List<TopQuotesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopQuotesModel {
    final String image;
    final String centerText;
    final List<String> tags;
    final String views;

    TopQuotesModel({
        required this.image,
        required this.centerText,
        required this.tags,
        required this.views,
    });

    factory TopQuotesModel.fromJson(Map<String, dynamic> json) => TopQuotesModel(
        image: json["image"],
        centerText: json["centerText"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        views: json["views"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "centerText": centerText,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "views": views,
    };
}
