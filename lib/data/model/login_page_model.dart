import 'dart:convert';

class LoginPageModel {
    final List<LoginDatum>? loginData;
    final int? ack;
    final String? msg;

    LoginPageModel({
        this.loginData,
        this.ack,
        this.msg,
    });

    LoginPageModel copyWith({
        List<LoginDatum>? loginData,
        int? ack,
        String? msg,
    }) => 
        LoginPageModel(
            loginData: loginData ?? this.loginData,
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory LoginPageModel.fromJson(String str) => LoginPageModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginPageModel.fromMap(Map<String, dynamic> json) => LoginPageModel(
        loginData: json["LoginData"] == null ? [] : List<LoginDatum>.from(json["LoginData"]!.map((x) => LoginDatum.fromMap(x))),
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "LoginData": loginData == null ? [] : List<dynamic>.from(loginData!.map((x) => x.toMap())),
        "Ack": ack,
        "msg": msg,
    };
}

class LoginDatum {
    final String? userId;
    final String? fname;
    final String? lname;
    final String? email;
    final String? phone;
    final String? address;
    final String? city;
    final String? state;
    final String? zip;

    LoginDatum({
        this.userId,
        this.fname,
        this.lname,
        this.email,
        this.phone,
        this.address,
        this.city,
        this.state,
        this.zip,
    });

    LoginDatum copyWith({
        String? userId,
        String? fname,
        String? lname,
        String? email,
        String? phone,
        String? address,
        String? city,
        String? state,
        String? zip,
    }) => 
        LoginDatum(
            userId: userId ?? this.userId,
            fname: fname ?? this.fname,
            lname: lname ?? this.lname,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            address: address ?? this.address,
            city: city ?? this.city,
            state: state ?? this.state,
            zip: zip ?? this.zip,
        );

    factory LoginDatum.fromJson(String str) => LoginDatum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginDatum.fromMap(Map<String, dynamic> json) => LoginDatum(
        userId: json["user_id"] ?? "1",
        fname: json["fname"] ?? "Unknown",
        lname: json["lname"] ?? "Unknown",
        email: json["email"] ?? "anonymous",
        phone: json["phone"] ?? "anonymous",
        address: json["address"] ?? "anonymous",
        city: json["city"] ?? "anonymous",
        state: json["state"] ?? "anonymous",
        zip: json["zip"] ?? "000000",
    );

    Map<String, dynamic> toMap() => {
        "user_id": userId ?? "1",
        "fname": fname ?? "Unknown",
        "lname": lname ?? "Unknown",
        "email": email ?? "anonymous",
        "phone": phone ?? "anonymous",
        "address": address ?? "anonymous",
        "city": city ?? "anonymous",
        "state": state ?? "anonymous",
        "zip": zip ?? "000000",
    };

    @override
    String toString() {
      return 'LoginDatum(userId : $userId, fname : $fname, lname : $lname, email : $email, phone : $phone, address : $address, city : $city, state : $state, zip : $zip)';
    }
}
