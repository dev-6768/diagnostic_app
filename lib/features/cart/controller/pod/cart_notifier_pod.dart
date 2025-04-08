import 'dart:async';

import 'package:diagnostic_app/bootstrap.dart';
import 'package:diagnostic_app/data/model/view_cart_model.dart';
import 'package:diagnostic_app/features/cart/controller/pod/add_to_cart_pod.dart';
import 'package:diagnostic_app/features/cart/controller/pod/delete_cart_pod.dart';
import 'package:diagnostic_app/features/cart/controller/pod/update_cart_pod.dart';
import 'package:diagnostic_app/features/home/controller/pod/view_cart_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<AsyncValue<ViewCartModel>> {
  final Ref ref;
  
  CartNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadCart();
  }
  
  Future<void> _loadCart() async {
    try {
      final viewCart = await ref.read(viewCartProvider.future);
      state = AsyncValue.data(viewCart);
      talker.debug("cart updated after operation. $state");
    } 
    
    catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
  
  Future<void> addToCart(List<int> cartItemData) async {
    try {
      await ref.read(addToCartProvider(cartItemData).future);
      ref.invalidate(viewCartProvider);
      await _loadCart();
    } 
    
    catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
  
  // Update a cart item
  Future<void> updateCart(List<int> updateItems) async {
    try {
      await ref.read(updateCartProvider(updateItems).future);
      ref.invalidate(viewCartProvider);
      await _loadCart();
    } 
    
    catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
  
  // Delete a cart item
  Future<void> deleteCart(int cartId) async {
    try {
      await ref.read(deleteCartProvider(cartId).future);
      ref.invalidate(viewCartProvider);
      await _loadCart();
    } 
    catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}

// Create a provider for the CartNotifier so it can be used throughout your app
final cartNotifierProvider = StateNotifierProvider<CartNotifier, AsyncValue<ViewCartModel>>((ref) {
  return CartNotifier(ref);
});
