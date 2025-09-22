import 'dart:convert';

AllQuotesModel allQuotesModelFromJson(String str) => AllQuotesModel.fromJson(json.decode(str));

String allQuotesModelToJson(AllQuotesModel data) => json.encode(data.toJson());

class AllQuotesModel {
    final id;
    final String status;
    final List<QuotesData> data;

    AllQuotesModel({
        required this.id,
        required this.status,
        required this.data,
    });

    factory AllQuotesModel.fromJson(Map<String, dynamic> json) => AllQuotesModel(
        status: json["status"],
        data: List<QuotesData>.from(json["data"].map((x) => QuotesData.fromJson(x))),
        id:json["id"]
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "id":id
    };
}


QuotesData quotesDataFromJson(String str) => QuotesData.fromJson(json.decode(str));

String quotesDataToJson(QuotesData data) => json.encode(data.toJson());

class QuotesData {
    final int id;
    final String quote;
    final int isText;
    final int viewCount;
    final List<String> keywords;

    QuotesData({
        required this.id,
        required this.quote,
        required this.isText,
        required this.viewCount,
        required this.keywords,
    });

    factory QuotesData.fromJson(Map<String, dynamic> json) => QuotesData(
        id: json["id"],
        quote: json["quote"],
        isText: json["is_text"],
        viewCount: json["view_count"],
        keywords: List<String>.from(json["keywords"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quote": quote,
        "is_text": isText,
        "view_count": viewCount,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
    };
}
