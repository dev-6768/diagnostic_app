import 'dart:convert';

class DeleteCartResponseModel {
    final int ack;
    final String msg;

    DeleteCartResponseModel({
        required this.ack,
        required this.msg,
    });

    DeleteCartResponseModel copyWith({
        int? ack,
        String? msg,
    }) => 
        DeleteCartResponseModel(
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory DeleteCartResponseModel.fromJson(String str) => DeleteCartResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DeleteCartResponseModel.fromMap(Map<String, dynamic> json) => DeleteCartResponseModel(
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "Ack": ack,
        "msg": msg,
    };
}
