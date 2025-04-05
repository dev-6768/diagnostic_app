import 'package:diagnostic_app/data/model/update_cart_response_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateCartProvider = FutureProvider.autoDispose.family<UpdateCartResponseModel, List<int>>(
  (ref, updateItems) async {
    final result = await ref.watch(apiHelperProvider).updateCart(cartId: updateItems[0], quantity: updateItems[1]);
    return result.when(
      (updateCartResponse) async {
        return updateCartResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "updateCartProvider",
);
