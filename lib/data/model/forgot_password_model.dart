import 'dart:convert';

class ForgotPasswordModel {
    final int? ack;
    final String? msg;

    ForgotPasswordModel({
        this.ack,
        this.msg,
    });

    ForgotPasswordModel copyWith({
        int? ack,
        String? msg,
    }) => 
        ForgotPasswordModel(
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory ForgotPasswordModel.fromJson(String str) => ForgotPasswordModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ForgotPasswordModel.fromMap(Map<String, dynamic> json) => ForgotPasswordModel(
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "Ack": ack,
        "msg": msg,
    };
}
