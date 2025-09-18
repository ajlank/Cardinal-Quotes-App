
import 'dart:convert';

List<AppBarItemModel> drawerItemModelFromJson(String str) => List<AppBarItemModel>.from(json.decode(str).map((x) => AppBarItemModel.fromJson(x)));

String drawerItemModelToJson(List<AppBarItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppBarItemModel {
    final int id;
    final String image;
    final String title;

    AppBarItemModel({
        required this.id,
        required this.image,
        required this.title,
    });

    factory AppBarItemModel.fromJson(Map<String, dynamic> json) => AppBarItemModel(
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
