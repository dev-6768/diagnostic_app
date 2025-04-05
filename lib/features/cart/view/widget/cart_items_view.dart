import 'package:diagnostic_app/data/model/view_cart_model.dart';
import 'package:diagnostic_app/features/cart/view/cart_page.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_header.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_item_tile.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_summary.dart';
import 'package:flutter/material.dart';

class CartItemsView extends StatelessWidget {
  final List<CartData> cartItems;
  final double totalPrice;

  const CartItemsView({
    super.key,
    required this.cartItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartHeader(itemCount: cartItems.length),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: cartItems.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return CartItemTile(
                cartId: item.cartId,
                testName: item.testName,
                quantity: int.tryParse(item.quantity)!,
                price: double.tryParse(item.unitPrice)!,
              );
            },
          ),
        ),
        const Divider(height: 1),
        CartSummary(totalPrice: totalPrice),
      ],
    );
  }
}
