import 'dart:convert';

class AppointmentBookingModel {
    final int? ack;
    final String? msg;

    AppointmentBookingModel({
        this.ack,
        this.msg,
    });

    AppointmentBookingModel copyWith({
        int? ack,
        String? msg,
    }) => 
        AppointmentBookingModel(
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory AppointmentBookingModel.fromJson(String str) => AppointmentBookingModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AppointmentBookingModel.fromMap(Map<String, dynamic> json) => AppointmentBookingModel(
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "Ack": ack,
        "msg": msg,
    };
}
