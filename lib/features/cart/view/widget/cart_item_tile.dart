import 'package:diagnostic_app/bootstrap.dart';
import 'package:diagnostic_app/core/router/router.gr.dart';
import 'package:diagnostic_app/features/cart/controller/pod/cart_notifier_pod.dart';
import 'package:diagnostic_app/features/cart/controller/pod/delete_cart_pod.dart';
import 'package:diagnostic_app/features/cart/controller/pod/update_cart_pod.dart';
import 'package:diagnostic_app/features/cart/view/widget/quantity_button.dart';
import 'package:diagnostic_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class CartItemTile extends StatelessWidget {
  final String cartId;
  final String testName;
  final int quantity;
  final double price;
  final int index;

  const CartItemTile({
    super.key,
    required this.cartId,
    required this.testName,
    required this.quantity,
    required this.price,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF1E88E5).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.medical_services_outlined,
              color: Color(0xFF1E88E5),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  testName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '₹${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Color(0xFF1E88E5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      return QuantityButton(
                        icon: Icons.remove,
                        onPressed: () {
                          final response = ref.watch(cartNotifierProvider.notifier).updateCart([(int.tryParse(cartId) ?? 0), -1]);
                          talker.debug(response);
                          // Increase quantity functionality would go here
                        },
                      );
                    },
                  ),

                  
                  Consumer(
                    builder: (context, ref, child) {
                      final viewCartAsync = ref.watch(cartNotifierProvider);
                      return viewCartAsync.easyWhen(data: (viewCartModel) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            viewCartModel.cartData[index].quantity,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      });
                      
                      
                    },
                  ),

                  Consumer(
                    builder: (context, ref, child) {
                      return QuantityButton(
                        icon: Icons.add,
                        onPressed: () {
                          final response = ref.watch(cartNotifierProvider.notifier).updateCart([(int.tryParse(cartId) ?? 0), 1]);
                          talker.debug(response);
                          // Increase quantity functionality would go here
                        },
                      );
                      
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  return GestureDetector(
                    onTap: () async {
                      await ref.read(cartNotifierProvider.notifier).deleteCart(int.tryParse(cartId) ?? 0);
                      // Remove item functionality would go here

                      context.navigateTo(ActionStatusRoute(isSuccess: true, message : "Item removed from cart."));

                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text('Item removed from cart. Please refresh page'),
                      //   ),
                      // );
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                          size: 16,
                        ),
                        SizedBox(width: 2),
                        Text(
                          'Remove',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
