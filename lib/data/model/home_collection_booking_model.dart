import 'dart:convert';

class HomeCollectionBookingModel {
    final int? ack;
    final String? msg;

    HomeCollectionBookingModel({
        this.ack,
        this.msg,
    });

    HomeCollectionBookingModel copyWith({
        int? ack,
        String? msg,
    }) => 
        HomeCollectionBookingModel(
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory HomeCollectionBookingModel.fromJson(String str) => HomeCollectionBookingModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HomeCollectionBookingModel.fromMap(Map<String, dynamic> json) => HomeCollectionBookingModel(
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "Ack": ack,
        "msg": msg,
    };
}
