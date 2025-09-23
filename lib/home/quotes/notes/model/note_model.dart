import 'dart:convert';

NoteModel noteModelFromJson(String str) => NoteModel.fromJson(json.decode(str));

String noteModelToJson(NoteModel data) => json.encode(data.toJson());

class NoteModel {
    final String note;
    final String title;

    NoteModel({
        required this.note,
        required this.title,
    });

    factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        note: json["note"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "note": note,
        "title": title,
    };
}
