import 'dart:convert';

class CheckoutModel {
    final int? ack;
    final String? msg;

    CheckoutModel({
        this.ack,
        this.msg,
    });

    CheckoutModel copyWith({
        int? ack,
        String? msg,
    }) => 
        CheckoutModel(
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory CheckoutModel.fromJson(String str) => CheckoutModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CheckoutModel.fromMap(Map<String, dynamic> json) => CheckoutModel(
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "Ack": ack,
        "msg": msg,
    };
}
