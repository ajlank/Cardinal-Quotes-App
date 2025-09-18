
import 'dart:convert';

List<DrawerItemModel> drawerItemModelFromJson(String str) => List<DrawerItemModel>.from(json.decode(str).map((x) => DrawerItemModel.fromJson(x)));

String drawerItemModelToJson(List<DrawerItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DrawerItemModel {
    final int id;
    final String image;
    final String title;

    DrawerItemModel({
        required this.id,
        required this.image,
        required this.title,
    });

    factory DrawerItemModel.fromJson(Map<String, dynamic> json) => DrawerItemModel(
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
