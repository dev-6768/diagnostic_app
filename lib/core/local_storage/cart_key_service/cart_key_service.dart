import 'package:diagnostic_app/core/local_storage/app_storage.dart';
import 'package:uuid/uuid.dart';

class CartKeyService {
  final AppStorage storage;
  static const _cartKeyName = 'cart_data_information_key';
  static final Uuid _uuid = Uuid();

  CartKeyService(this.storage);

  /// Initialize the cart key if absent
  Future<void> initializeCartKeyIfAbsent() async {
    await storage.init();
    final existing = storage.get(key: _cartKeyName);
    if (existing == null) {
      final newKey = _generateCartKey();
      await storage.put(key: _cartKeyName, value: newKey);
    }
  }

  /// Read the current cart key
  String? getCartKey() {
    return storage.get(key: _cartKeyName);
  }

  /// Regenerate and replace the cart key
  Future<void> regenerateCartKey() async {
    await storage.init();
    final newKey = _generateCartKey();
    await storage.put(key: _cartKeyName, value: newKey);
  }

  String _generateCartKey() => _uuid.v4();
}