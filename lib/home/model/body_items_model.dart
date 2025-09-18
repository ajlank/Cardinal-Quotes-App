
import 'dart:convert';

List<BodyItemsModel> drawerItemModelFromJson(String str) => List<BodyItemsModel>.from(json.decode(str).map((x) => BodyItemsModel.fromJson(x)));

String drawerItemModelToJson(List<BodyItemsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BodyItemsModel {
    final int id;
    final String image;
    final String title;

    BodyItemsModel({
        required this.id,
        required this.image,
        required this.title,
    });

    factory BodyItemsModel.fromJson(Map<String, dynamic> json) => BodyItemsModel(
        id: json["id"],
        image: json["image"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
    };
}
