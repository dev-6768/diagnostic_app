import 'dart:convert';

class HomeCollectionBookingTestModel {
    final int? ack;
    final String? msg;

    HomeCollectionBookingTestModel({
        this.ack,
        this.msg,
    });

    HomeCollectionBookingTestModel copyWith({
        int? ack,
        String? msg,
    }) => 
        HomeCollectionBookingTestModel(
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory HomeCollectionBookingTestModel.fromJson(String str) => HomeCollectionBookingTestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HomeCollectionBookingTestModel.fromMap(Map<String, dynamic> json) => HomeCollectionBookingTestModel(
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "Ack": ack,
        "msg": msg,
    };
}
