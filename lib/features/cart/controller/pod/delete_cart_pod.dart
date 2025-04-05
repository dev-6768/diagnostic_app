import 'package:diagnostic_app/data/model/delete_cart_response_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteCartProvider = FutureProvider.autoDispose.family<DeleteCartResponseModel, int>(
  (ref, cartId) async {
    final result = await ref.watch(apiHelperProvider).deleteCart(cartId: cartId);
    return result.when(
      (deleteCartModelResponse) async {
        return deleteCartModelResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "deleteCartProvider",
);
