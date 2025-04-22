// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diagnostic_app/data/model/add_to_cart_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:diagnostic_app/features/home/controller/pod/view_cart_pod.dart';

final addToCartProvider =
    FutureProvider.autoDispose.family<AddToCartResponseModel, AddToCartRequestData>(
  (ref, addToCartRequestData) async {
    final result = await ref.watch(apiHelperProvider).addToCart(
          quantity: addToCartRequestData.quantity,
          price: addToCartRequestData.price,
          testName: addToCartRequestData.testName,
        );
    return result.when(
      (addToCartResponse) async {
        ref.invalidate(viewCartProvider);
        return addToCartResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "addToCartProvider",
);

class AddToCartRequestData {
  final int quantity;
  final double price;
  final String testName;
  AddToCartRequestData({
    required this.quantity,
    required this.price,
    required this.testName,
  });

  

  @override
  bool operator ==(covariant AddToCartRequestData other) {
    if (identical(this, other)) return true;
  
    return 
      other.quantity == quantity &&
      other.price == price &&
      other.testName == testName;
  }

  @override
  int get hashCode => quantity.hashCode ^ price.hashCode ^ testName.hashCode;
}
