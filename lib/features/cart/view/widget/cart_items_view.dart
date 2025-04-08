import 'package:diagnostic_app/data/model/view_cart_model.dart';
import 'package:diagnostic_app/features/cart/controller/pod/cart_notifier_pod.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_header.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_item_tile.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_summary.dart';
import 'package:diagnostic_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItemsView extends StatelessWidget {
  final double totalPrice;

  const CartItemsView({
    super.key,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final viewCartAsync = ref.watch(cartNotifierProvider);
        return viewCartAsync.easyWhen(data: (viewCartModel) {
          return Column(
            children: [
              CartHeader(itemCount: viewCartModel.cartData.length),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: viewCartModel.cartData.length,
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = viewCartModel.cartData[index];
                    return CartItemTile(
                      cartId: item.cartId,
                      testName: item.testName,
                      quantity: int.tryParse(item.quantity)!,
                      price: double.tryParse(item.unitPrice)!,
                      index: index,
                    );
                  },
                ),
              ),
              const Divider(height: 1),
              CartSummary(totalPrice: totalPrice),
            ],
          );
        });
      }
    );
  }
}
