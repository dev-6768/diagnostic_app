import 'package:diagnostic_app/data/model/order_tracking_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userOrderTrackingProvider = FutureProvider.family<TrackDataModel, (String userId, String orderId)>((ref, params) async {
  final (userId, orderId) = params;

  final result = await ref.read(apiHelperProvider).userOrderTracking(userId: userId, orderId: orderId);
  return result.when(
    (userOrderTrackModel) async {
      return userOrderTrackModel;
    },
    (error) => throw error,
  );
});