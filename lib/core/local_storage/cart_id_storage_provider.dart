import 'package:diagnostic_app/core/local_storage/app_storage_pod.dart';
import 'package:diagnostic_app/core/local_storage/cart_key_service/cart_key_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartKeyServiceProvider = Provider.autoDispose<CartKeyService>(
  (ref) => CartKeyService(ref.watch(appStorageProvider)),
  name: 'cartKeyServiceProvider',
);