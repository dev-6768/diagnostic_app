import 'dart:convert';

class UpdateCartResponseModel {
    final int ack;
    final String msg;

    UpdateCartResponseModel({
        required this.ack,
        required this.msg,
    });

    UpdateCartResponseModel copyWith({
        int? ack,
        String? msg,
    }) => 
        UpdateCartResponseModel(
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory UpdateCartResponseModel.fromJson(String str) => UpdateCartResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UpdateCartResponseModel.fromMap(Map<String, dynamic> json) => UpdateCartResponseModel(
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "Ack": ack,
        "msg": msg,
    };
}
