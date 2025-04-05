import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  final int itemCount;

  const CartHeader({
    super.key,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      color: const Color(0xFF1E88E5).withOpacity(0.1),
      child: Row(
        children: [
          const Icon(
            Icons.shopping_cart,
            color: Color(0xFF1E88E5),
          ),
          const SizedBox(width: 10),
          Text(
            '$itemCount ${itemCount == 1 ? 'item' : 'items'} in your cart',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
