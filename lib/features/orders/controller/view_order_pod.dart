import 'package:diagnostic_app/data/model/login_page_model.dart';
import 'package:diagnostic_app/data/model/orders_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userOrdersProvider = FutureProvider.family<OrderDataModel, String>((ref, userId) async {
  final result = await ref.read(apiHelperProvider).userOrders(
    userId: (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].userId ?? "1",
  );
  return result.when(
    (ordersResponse) async {
      return ordersResponse;
    },

    (error) => throw error,
  );
});