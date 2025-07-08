import 'package:diagnostic_app/data/model/order_report_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userOrderReportProvider = FutureProvider.family<ReportDataModel, (String userId, String orderId)>((ref, params) async {
  final (userId, orderId) = params;

  final result = await ref.read(apiHelperProvider).userOrderReport(userId: userId, orderId: orderId);
  return result.when(
    (orderReportModel) async {
      return orderReportModel;
    },
    (error) => throw error,
  );
});
