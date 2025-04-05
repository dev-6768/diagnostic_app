import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/const/resource.dart';
import 'package:diagnostic_app/data/model/view_cart_model.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_bottom_bar.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_item_tile.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_items_view.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_summary.dart';
import 'package:diagnostic_app/features/cart/view/widget/empty_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  final List<CartData> cartItems;
  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return CartView(
      cartItems: cartItems,
    );
  }
}

class CartView extends StatelessWidget {
  final List<CartData> cartItems;
  const CartView({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    //caculate total price
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += double.tryParse(item.unitPrice)! * int.tryParse(item.quantity)!;
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: () {
              // Refresh cart functionality would go here
            },
          ),
        ],
        title: const Text(
          'My Cart',
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: cartItems.isEmpty
          ? const EmptyCartView()
          : CartItemsView(cartItems: cartItems, totalPrice: totalPrice),
      bottomNavigationBar: cartItems.isEmpty ? null : CartBottomBar(totalPrice: totalPrice),
    );
  }
}
