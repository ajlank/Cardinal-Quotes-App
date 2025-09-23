
import 'dart:convert';

GetNoteModel getNoteModelFromJson(String str) => GetNoteModel.fromJson(json.decode(str));

String getNoteModelToJson(GetNoteModel data) => json.encode(data.toJson());

class GetNoteModel {
    final String status;
    final List<Dt> data;

    GetNoteModel({
        required this.status,
        required this.data,
    });

    factory GetNoteModel.fromJson(Map<String, dynamic> json) => GetNoteModel(
        status: json["status"],
        data: List<Dt>.from(json["data"].map((x) => Dt.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Dt {
    final int id;
    final String title;
    final String note;
    final DateTime date;

    Dt({
        required this.id,
        required this.title,
        required this.note,
        required this.date,
    });

    factory Dt.fromJson(Map<String, dynamic> json) => Dt(
        id: json["id"],
        title: json["title"],
        note: json["note"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "note": note,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    };
}
