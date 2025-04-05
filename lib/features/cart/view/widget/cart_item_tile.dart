import 'package:diagnostic_app/features/cart/controller/pod/delete_cart_pod.dart';
import 'package:diagnostic_app/features/cart/view/widget/quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItemTile extends StatelessWidget {
  final String cartId;
  final String testName;
  final int quantity;
  final double price;

  const CartItemTile({
    super.key,
    required this.cartId,
    required this.testName,
    required this.quantity,
    required this.price,
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
                  QuantityButton(
                    icon: Icons.remove,
                    onPressed: () {
                      // Decrease quantity functionality would go here
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '$quantity',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  QuantityButton(
                    icon: Icons.add,
                    onPressed: () {
                      // Increase quantity functionality would go here
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(deleteCartProvider(int.tryParse(cartId)!));
                      // Remove item functionality would go here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item removed from cart. Please refresh page'),
                        ),
                      );
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
