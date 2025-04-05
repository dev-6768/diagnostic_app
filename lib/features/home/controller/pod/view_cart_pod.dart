import 'package:diagnostic_app/data/model/view_cart_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewCartProvider = FutureProvider.autoDispose<ViewCartModel>(
  (ref) async {
    final result = await ref.watch(apiHelperProvider).getCart();
    return result.when(
      (viewCartModelResponse) async {
        return viewCartModelResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "viewCartProvider",
);
