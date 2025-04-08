import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/data/model/view_cart_model.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_bottom_bar.dart';
import 'package:diagnostic_app/features/cart/view/widget/cart_items_view.dart';
import 'package:diagnostic_app/features/cart/view/widget/empty_cart_view.dart';
import 'package:diagnostic_app/features/home/controller/pod/view_cart_pod.dart';
import 'package:diagnostic_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    return Consumer(
      builder: (context, ref, child) {
        final viewCartAsync = ref.watch(viewCartProvider);
        return viewCartAsync.easyWhen(data: (viewCartModel) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'My Cart',
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
            ),

            body: viewCartModel.cartData == null || viewCartModel.cartData.isEmpty 
              ? const EmptyCartView()
              : CartItemsView(totalPrice: totalPrice),      
            
            bottomNavigationBar: cartItems.isEmpty ? null : CartBottomBar(totalPrice: double.parse(viewCartModel.priceData.totalPrice)),
          );
        });
      }
    );
  }
}
