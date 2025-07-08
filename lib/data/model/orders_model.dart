// class OrderDataModel {
//   final List<OrderData> orderData;
//   final int ack;
//   final String msg;

//   OrderDataModel({
//     required this.orderData,
//     required this.ack,
//     required this.msg,
//   });

//   factory OrderDataModel.fromMap(Map<String, dynamic> map) {
//     return OrderDataModel(
//       orderData: List<OrderData>.from(
//         (map['OrderData'] ?? []).map((x) => OrderData.fromMap(x)),
//       ),
//       ack: map['Ack'] ?? 0,
//       msg: map['msg'] ?? '',
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'OrderData': orderData.map((x) => x.toMap()).toList(),
//       'Ack': ack,
//       'msg': msg,
//     };
//   }

//   OrderDataModel copyWith({
//     List<OrderData>? orderData,
//     int? ack,
//     String? msg,
//   }) {
//     return OrderDataModel(
//       orderData: orderData ?? this.orderData,
//       ack: ack ?? this.ack,
//       msg: msg ?? this.msg,
//     );
//   }
// }

// class OrderData {
//   final String orderId;
//   final String userId;
//   final String totalItems;
//   final String totalPrice;
//   final String orderDate;
//   final String paymentStatus;
//   final String deliveryStatus;
//   final String cartData;

//   OrderData({
//     required this.orderId,
//     required this.userId,
//     required this.totalItems,
//     required this.totalPrice,
//     required this.orderDate,
//     required this.paymentStatus,
//     required this.deliveryStatus,
//     required this.cartData,
//   });

//   factory OrderData.fromMap(Map<String, dynamic> map) {
//     return OrderData(
//       orderId: map['order_id'] ?? '',
//       userId: map['user_id'] ?? '',
//       totalItems: map['total_items'] ?? '',
//       totalPrice: map['total_price'] ?? '',
//       orderDate: map['order_date'] ?? '',
//       paymentStatus: map['payment_status'] ?? '',
//       deliveryStatus: map['delivery_status'] ?? '',
//       cartData: map['cartData'] ?? '',
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'order_id': orderId,
//       'user_id': userId,
//       'total_items': totalItems,
//       'total_price': totalPrice,
//       'order_date': orderDate,
//       'payment_status': paymentStatus,
//       'delivery_status': deliveryStatus,
//       'cartData': cartData,
//     };
//   }

//   OrderData copyWith({
//     String? orderId,
//     String? userId,
//     String? totalItems,
//     String? totalPrice,
//     String? orderDate,
//     String? paymentStatus,
//     String? deliveryStatus,
//     String? cartData,
//   }) {
//     return OrderData(
//       orderId: orderId ?? this.orderId,
//       userId: userId ?? this.userId,
//       totalItems: totalItems ?? this.totalItems,
//       totalPrice: totalPrice ?? this.totalPrice,
//       orderDate: orderDate ?? this.orderDate,
//       paymentStatus: paymentStatus ?? this.paymentStatus,
//       deliveryStatus: deliveryStatus ?? this.deliveryStatus,
//       cartData: cartData ?? this.cartData,
//     );
//   }
// }



class OrderDataModel {
  final List<OrderData> orderData;
  final int ack;
  final String msg;

  OrderDataModel({
    required this.orderData,
    required this.ack,
    required this.msg,
  });

  factory OrderDataModel.fromMap(Map<String, dynamic> map) {
    return OrderDataModel(
      orderData: List<OrderData>.from(
        (map['OrderData'] ?? []).map((x) => OrderData.fromMap(x)),
      ),
      ack: map['Ack'] ?? 0,
      msg: map['msg'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OrderData': orderData.map((x) => x.toMap()).toList(),
      'Ack': ack,
      'msg': msg,
    };
  }

  OrderDataModel copyWith({
    List<OrderData>? orderData,
    int? ack,
    String? msg,
  }) {
    return OrderDataModel(
      orderData: orderData ?? this.orderData,
      ack: ack ?? this.ack,
      msg: msg ?? this.msg,
    );
  }
}

class OrderData {
  final String orderId;
  final String userId;
  final String totalItems;
  final String totalPrice;
  final String orderDate;
  final String paymentStatus;
  final String deliveryStatus;
  final List<CartData>? cartData;

  OrderData({
    required this.orderId,
    required this.userId,
    required this.totalItems,
    required this.totalPrice,
    required this.orderDate,
    required this.paymentStatus,
    required this.deliveryStatus,
    this.cartData,
  });

  factory OrderData.fromMap(Map<String, dynamic> map) {
    return OrderData(
      orderId: map['order_id'] ?? '',
      userId: map['user_id'] ?? '',
      totalItems: map['total_items'] ?? '',
      totalPrice: map['total_price'] ?? '',
      orderDate: map['order_date'] ?? '',
      paymentStatus: map['payment_status'] ?? '',
      deliveryStatus: map['delivery_status'] ?? '',
      cartData: map['cartData'] != null
          ? List<CartData>.from(map['cartData'].map((x) => CartData.fromMap(x)))
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'order_id': orderId,
      'user_id': userId,
      'total_items': totalItems,
      'total_price': totalPrice,
      'order_date': orderDate,
      'payment_status': paymentStatus,
      'delivery_status': deliveryStatus,
      'cartData': cartData?.map((x) => x.toMap()).toList(),
    };
  }

  OrderData copyWith({
    String? orderId,
    String? userId,
    String? totalItems,
    String? totalPrice,
    String? orderDate,
    String? paymentStatus,
    String? deliveryStatus,
    List<CartData>? cartData,
  }) {
    return OrderData(
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      totalItems: totalItems ?? this.totalItems,
      totalPrice: totalPrice ?? this.totalPrice,
      orderDate: orderDate ?? this.orderDate,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      cartData: cartData ?? this.cartData,
    );
  }
}

class CartData {
  final String cartId;
  final String testName;
  final String unitPrice;
  final String quantity;
  final String subtotal;

  CartData({
    required this.cartId,
    required this.testName,
    required this.unitPrice,
    required this.quantity,
    required this.subtotal,
  });

  factory CartData.fromMap(Map<String, dynamic> map) {
    return CartData(
      cartId: map['cart_id'] ?? '',
      testName: map['test_name'] ?? '',
      unitPrice: map['unit_price'] ?? '',
      quantity: map['quantity'] ?? '',
      subtotal: map['subtotal'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cart_id': cartId,
      'test_name': testName,
      'unit_price': unitPrice,
      'quantity': quantity,
      'subtotal': subtotal,
    };
  }

  CartData copyWith({
    String? cartId,
    String? testName,
    String? unitPrice,
    String? quantity,
    String? subtotal,
  }) {
    return CartData(
      cartId: cartId ?? this.cartId,
      testName: testName ?? this.testName,
      unitPrice: unitPrice ?? this.unitPrice,
      quantity: quantity ?? this.quantity,
      subtotal: subtotal ?? this.subtotal,
    );
  }
}

