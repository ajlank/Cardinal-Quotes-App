

import 'dart:convert';

FeaturedsModel featuredsModelFromJson(String str) => FeaturedsModel.fromJson(json.decode(str));

String featuredsModelToJson(FeaturedsModel data) => json.encode(data.toJson());

class FeaturedsModel {
  final String status;
  final FeaturedsData data;

  FeaturedsModel({
    required this.status,
    required this.data,
  });

  factory FeaturedsModel.fromJson(Map<String, dynamic> json) => FeaturedsModel(
        status: json["status"],
        data: FeaturedsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class FeaturedsData {
  final List<QuoteItem> quoteList;
  final List<VisualItem> visualList;

  FeaturedsData({
    required this.quoteList,
    required this.visualList,
  });

  factory FeaturedsData.fromJson(Map<String, dynamic> json) => FeaturedsData(
        quoteList: List<QuoteItem>.from(json["quoteList"].map((x) => QuoteItem.fromJson(x))),
        visualList: List<VisualItem>.from(json["visualList"].map((x) => VisualItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "quoteList": List<dynamic>.from(quoteList.map((x) => x.toJson())),
        "visualList": List<dynamic>.from(visualList.map((x) => x.toJson())),
      };
}

class QuoteItem {
  final int featuredId;
  final int id;
  final int isText;
  final String quote;

  QuoteItem({
    required this.featuredId,
    required this.id,
    required this.isText,
    required this.quote,
  });

  factory QuoteItem.fromJson(Map<String, dynamic> json) => QuoteItem(
        featuredId: json["featured_id"],
        id: json["id"],
        isText: json["is_text"],
        quote: json["quote"],
      );

  Map<String, dynamic> toJson() => {
        "featured_id": featuredId,
        "id": id,
        "is_text": isText,
        "quote": quote,
      };
}

class VisualItem {
  final int featuredId;
  final int id;
  final VisualCategory category;
  final String imagePath;

  VisualItem({
    required this.featuredId,
    required this.id,
    required this.category,
    required this.imagePath,
  });

  factory VisualItem.fromJson(Map<String, dynamic> json) => VisualItem(
        featuredId: json["featured_id"],
        id: json["id"],
        category: visualCategoryValues.map[json["category"]] ?? VisualCategory.WALLPAPER,
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "featured_id": featuredId,
        "id": id,
        "category": visualCategoryValues.reverse[category],
        "image_path": imagePath,
      };
}

enum VisualCategory { MEMORIAL_CARD, WALLPAPER }

final visualCategoryValues = EnumValues({
  "memorial_card": VisualCategory.MEMORIAL_CARD,
  "wallpaper": VisualCategory.WALLPAPER,
});

class EnumValues<T> {
  final Map<String, T> map;
  Map<T, String>? _reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return _reverseMap ??= map.map((k, v) => MapEntry(v, k));
  }
}
