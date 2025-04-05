import 'dart:convert';

class ContactDetailsModel {
    final ContactData contactData;

    ContactDetailsModel({
        required this.contactData,
    });

    ContactDetailsModel copyWith({
        ContactData? contactData,
    }) => 
        ContactDetailsModel(
            contactData: contactData ?? this.contactData,
        );

    factory ContactDetailsModel.fromJson(String str) => ContactDetailsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ContactDetailsModel.fromMap(Map<String, dynamic> json) => ContactDetailsModel(
        contactData: ContactData.fromMap(json["ContactData"]),
    );

    Map<String, dynamic> toMap() => {
        "ContactData": contactData.toMap(),
    };
}

class ContactData {
    final String corporateOfficeAddress;
    final String laboratoryAddress;
    final String contactNo1;
    final String contactNo2;
    final String contactEmail;
    final int ack;
    final String msg;

    ContactData({
        required this.corporateOfficeAddress,
        required this.laboratoryAddress,
        required this.contactNo1,
        required this.contactNo2,
        required this.contactEmail,
        required this.ack,
        required this.msg,
    });

    ContactData copyWith({
        String? corporateOfficeAddress,
        String? laboratoryAddress,
        String? contactNo1,
        String? contactNo2,
        String? contactEmail,
        int? ack,
        String? msg,
    }) => 
        ContactData(
            corporateOfficeAddress: corporateOfficeAddress ?? this.corporateOfficeAddress,
            laboratoryAddress: laboratoryAddress ?? this.laboratoryAddress,
            contactNo1: contactNo1 ?? this.contactNo1,
            contactNo2: contactNo2 ?? this.contactNo2,
            contactEmail: contactEmail ?? this.contactEmail,
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory ContactData.fromJson(String str) => ContactData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ContactData.fromMap(Map<String, dynamic> json) => ContactData(
        corporateOfficeAddress: json["corporate_office_address"],
        laboratoryAddress: json["laboratory_address"],
        contactNo1: json["contact_no1"],
        contactNo2: json["contact_no2"],
        contactEmail: json["contact_email"],
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "corporate_office_address": corporateOfficeAddress,
        "laboratory_address": laboratoryAddress,
        "contact_no1": contactNo1,
        "contact_no2": contactNo2,
        "contact_email": contactEmail,
        "Ack": ack,
        "msg": msg,
    };
}
