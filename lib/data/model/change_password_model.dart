import 'dart:convert';

class ChangePasswordModel {
    final int? ack;
    final String? msg;

    ChangePasswordModel({
        this.ack,
        this.msg,
    });

    ChangePasswordModel copyWith({
        int? ack,
        String? msg,
    }) => 
        ChangePasswordModel(
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory ChangePasswordModel.fromJson(String str) => ChangePasswordModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ChangePasswordModel.fromMap(Map<String, dynamic> json) => ChangePasswordModel(
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "Ack": ack,
        "msg": msg,
    };
}
