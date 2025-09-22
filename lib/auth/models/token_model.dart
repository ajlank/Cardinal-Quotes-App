import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
    final String status;
    final String message;
    final String token;

    TokenModel({
        required this.status,
        required this.message,
        required this.token,
    });

    factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
    };
}
