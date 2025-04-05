import 'dart:convert';

class AddToCartResponseModel {
    final int ack;
    final String msg;

    AddToCartResponseModel({
        required this.ack,
        required this.msg,
    });

    @override
    bool operator ==(Object other) =>
        identical(this, other) ||
        other is AddToCartResponseModel &&
            runtimeType == other.runtimeType &&
            ack == other.ack &&
            msg == other.msg;

    @override
    int get hashCode => ack.hashCode ^ msg.hashCode;

    AddToCartResponseModel copyWith({
        int? ack,
        String? msg,
    }) => 
        AddToCartResponseModel(
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory AddToCartResponseModel.fromJson(String str) => AddToCartResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AddToCartResponseModel.fromMap(Map<String, dynamic> json) => AddToCartResponseModel(
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "Ack": ack,
        "msg": msg,
    };
}
