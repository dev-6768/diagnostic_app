import 'dart:convert';

class SignupPageModel {
    final int? ack;
    final int? userId;
    final String? msg;

    SignupPageModel({
        this.ack,
        this.userId,
        this.msg,
    });

    SignupPageModel copyWith({
        int? ack,
        int? userId,
        String? msg,
    }) => 
        SignupPageModel(
            ack: ack ?? this.ack,
            userId: userId ?? this.userId,
            msg: msg ?? this.msg,
        );

    factory SignupPageModel.fromJson(String str) => SignupPageModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SignupPageModel.fromMap(Map<String, dynamic> json) => SignupPageModel(
        ack: json["Ack"],
        userId: json["user_id"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "Ack": ack,
        "user_id": userId,
        "msg": msg,
    };
}
