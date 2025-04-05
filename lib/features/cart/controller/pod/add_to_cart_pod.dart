import 'package:diagnostic_app/data/model/add_to_cart_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addToCartProvider = FutureProvider.autoDispose.family<AddToCartResponseModel, List<int>>(
  (ref, cartItemData) async {
    final result = await ref.watch(apiHelperProvider).addToCart(quantity: cartItemData[0], price: cartItemData[1]);
    return result.when(
      (addToCartResponse) async {
        return addToCartResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "addToCartProvider",
);
