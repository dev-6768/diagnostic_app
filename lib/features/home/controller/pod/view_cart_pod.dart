import 'package:diagnostic_app/core/local_storage/cart_id_storage_provider.dart';
import 'package:diagnostic_app/data/model/login_page_model.dart';
import 'package:diagnostic_app/data/model/view_cart_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewCartProvider = FutureProvider.autoDispose<ViewCartModel>(
  (ref) async {
    final cartIdProvider = ref.watch(cartKeyServiceProvider);
    final result = await ref.watch(apiHelperProvider).getCart(
      (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].userId ?? "1",
      cartIdProvider.getCartKey() ?? "1111111",
    );
    return result.when(
      (viewCartModelResponse) async {
        return viewCartModelResponse;
      },  
      (error) => throw (error.errorMessage),
    );
  },
  name: "viewCartProvider",
);
