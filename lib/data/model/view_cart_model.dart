import 'dart:convert';

class ViewCartModel {
    final List<CartData> cartData;
    final PriceData priceData;
    final int ack;
    final String msg;

    ViewCartModel({
        required this.cartData,
        required this.priceData,
        required this.ack,
        required this.msg,
    });

    ViewCartModel copyWith({
        List<CartData>? cartData,
        PriceData? priceData,
        int? ack,
        String? msg,
    }) => 
        ViewCartModel(
            cartData: cartData ?? this.cartData,
            priceData: priceData ?? this.priceData,
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory ViewCartModel.fromJson(String str) => ViewCartModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ViewCartModel.fromMap(Map<String, dynamic> json) => ViewCartModel(
        cartData: List<CartData>.from((json["CartData"] ?? []).map((x) => CartData.fromMap(x))),
        priceData: PriceData.fromMap((json["PriceData"] ?? {})),
        ack: json["Ack"] ?? "0",
        msg: json["msg"] ?? "No Data",
    );

    Map<String, dynamic> toMap() => {
        "CartData": List<dynamic>.from(cartData.map((x) => x.toMap())),
        "PriceData": priceData.toMap(),
        "Ack": ack,
        "msg": msg,
    };
}

class CartData {
    final String cartId;
    final String testName;
    final String quantity;
    final String unitPrice;
    final String subtotal;

    CartData({
        required this.cartId,
        required this.testName,
        required this.quantity,
        required this.unitPrice,
        required this.subtotal,
    });

    CartData copyWith({
        String? cartId,
        String? testName,
        String? quantity,
        String? unitPrice,
        String? subtotal,
    }) => 
        CartData(
            cartId: cartId ?? this.cartId,
            testName: testName ?? this.testName,
            quantity: quantity ?? this.quantity,
            unitPrice: unitPrice ?? this.unitPrice,
            subtotal: subtotal ?? this.subtotal,
        );

    factory CartData.fromJson(String str) => CartData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CartData.fromMap(Map<String, dynamic> json) => CartData(
        cartId: json["cart_id"] ?? "0",
        testName: json["test_name"] ?? "abc",
        quantity: json["quantity"] ?? "0",
        unitPrice: json["unit_price"] ?? "0.00",
        subtotal: json["subtotal"] ?? "0.00",
    );

    Map<String, dynamic> toMap() => {
        "cart_id": cartId,
        "test_name": testName,
        "quantity": quantity,
        "unit_price": unitPrice,
        "subtotal": subtotal,
    };
}

class PriceData {
    final String totalPrice;
    final String totalQuantity;
    final String grandTotal;

    PriceData({
        required this.totalPrice,
        required this.totalQuantity,
        required this.grandTotal,
    });

    PriceData copyWith({
        String? totalPrice,
        String? totalQuantity,
        String? grandTotal,
    }) => 
        PriceData(
            totalPrice: totalPrice ?? this.totalPrice,
            totalQuantity: totalQuantity ?? this.totalQuantity,
            grandTotal: grandTotal ?? this.grandTotal,
        );

    factory PriceData.fromJson(String str) => PriceData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PriceData.fromMap(Map<String, dynamic> json) => PriceData(
        totalPrice: json["total_price"] ?? "0.00",
        totalQuantity: json["total_quantity"] ?? "0",
        grandTotal: json["grand_total"] ?? "0.00",
    );

    Map<String, dynamic> toMap() => {
        "total_price": totalPrice,
        "total_quantity": totalQuantity,
        "grand_total": grandTotal,
    };
}
