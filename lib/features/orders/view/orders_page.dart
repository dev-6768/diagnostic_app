// import 'package:auto_route/auto_route.dart';
// import 'package:diagnostic_app/core/router/router.gr.dart';
// import 'package:diagnostic_app/data/model/login_page_model.dart';
// import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
// import 'package:diagnostic_app/features/orders/controller/view_order_pod.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// @RoutePage()
// class OrdersPage extends StatelessWidget {
//   const OrdersPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return OrdersView();
//   }
// }

// class OrdersView extends ConsumerStatefulWidget {
//   const OrdersView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _OrdersViewState();
// }

// class _OrdersViewState extends ConsumerState<OrdersView> {

//   @override
//   Widget build(BuildContext context) {
//     final ordersAsync = ref.watch(userOrdersProvider((ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].userId ?? "1"));
//     return  SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           foregroundColor: Colors.black,
//           backgroundColor: Colors.white,

//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios_outlined,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               context.pop();
//             },
//           ),
//           title: Text(
//             "My Orders",
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//             ),
//           ),          
//         ),
//         body: ordersAsync.when(
//           loading: () => const Center(child: CircularProgressIndicator()),
//           error: (err, _) => Center(child: Text('Error: ${err.toString()}')),
//           data: (orderDataModel) {
//             final orders = orderDataModel.orderData;

//             if (orders.isEmpty) {
//               return const Center(child: Text('No orders found.'));
//             }

//             return Container(
//               padding: EdgeInsets.all(10),
//               child: ListView.builder(
//                 itemCount: orders.length,
//                 itemBuilder: (context, index) {
//                   final order = orders[index];
//                   return Card(
//                     elevation: 10,
//                     clipBehavior: Clip.antiAlias,
//                     child: ListTile(
//                       onTap: () {
//                         if(order.deliveryStatus == "Pending") {
//                           context.navigateTo(OrderTrackingRoute(orderId: order.orderId));
//                         }

//                         else {
//                           context.navigateTo(OrderReportingRoute(orderId: order.orderId));
//                         }
                        
//                       },
//                       title: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,

//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               const Icon(Icons.receipt),
//                               const SizedBox(width: 10),
//                               Text(
//                                 "Order ID: ${order.orderId}",
//                                 style: TextStyle(
//                                   fontSize: 20,//Theme.of(context).textTheme.titleMedium!.fontSize,
//                                 ),
//                               ),
//                               const Spacer(),
//                               order.deliveryStatus == "Delivered"
//                                 ? Icon(Icons.check)
//                                 : Icon(Icons.question_mark),
//                             ],
//                           ),
                          
                          
//                           const SizedBox(height: 10),
                          
//                           order.cartData != null
//                           ? ListView.builder(
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               itemCount: order.cartData!.length,
//                               itemBuilder: (context, index) {
//                                 final cartItem = order.cartData![index];

//                                 return ListTile(
//                                   title: Text("Cart #${(index+1)}"),
//                                   subtitle: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,

//                                     children: [
//                                       Text(
//                                         "#${cartItem.testName}",
//                                       ),

//                                       const SizedBox(height: 10),

//                                       Text(
//                                         "Unit Price : ${cartItem.unitPrice}",
//                                       ),

//                                       const SizedBox(height: 10),

//                                       Text(
//                                         "Quantity : ${cartItem.quantity}",
//                                       ),

//                                       const SizedBox(height: 10),

//                                       Text(
//                                         "Subtotal : ${cartItem.subtotal}",
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               }
//                             )
                          
//                           : const SizedBox(),
//                         ],
//                       ),
                      
                      
//                       subtitle: Text(
//                         "Total Price: ₹${order.totalPrice}",
//                         style: TextStyle(
//                           fontSize: 14,//Theme.of(context).textTheme.titleMedium!.fontSize,
//                         ),
//                       ),
                      
//                     ),
//                   );
                  
                  
                  
//                 },
//               ),
//             );
            
            
//           },
//         ),
//       ),
//     );
//   }
// }


import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/core/router/router.gr.dart';
import 'package:diagnostic_app/data/model/login_page_model.dart';
import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
import 'package:diagnostic_app/features/orders/controller/view_order_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfessionalOrdersView();
  }
}

class ProfessionalOrdersView extends ConsumerStatefulWidget {
  const ProfessionalOrdersView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfessionalOrdersViewState();
}

class _ProfessionalOrdersViewState extends ConsumerState<ProfessionalOrdersView> {
  @override
  Widget build(BuildContext context) {
    final ordersAsync = ref.watch(userOrdersProvider((ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].userId ?? "1"));
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          // Modern App Bar
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF2D3748),
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF7FAFC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                onPressed: () => context.pop(),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'My Orders',
                style: TextStyle(
                  color: Color(0xFF2D3748),
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
              expandedTitleScale: 1.1,
            ),
          ),
          
          // Orders Content
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: ordersAsync.when(
              loading: () => const SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4F46E5)),
                        strokeWidth: 3,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Loading your orders...',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              error: (err, _) => SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF2F2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.error_outline,
                          color: Color(0xFFEF4444),
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Something went wrong',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        err.toString(),
                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              data: (orderDataModel) {
                final orders = orderDataModel.orderData;

                if (orders.isEmpty) {
                  return const SliverFillRemaining(
                    child: EmptyOrdersWidget(),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final order = orders[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ProfessionalOrderCard(order: order),
                      );
                    },
                    childCount: orders.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfessionalOrderCard extends StatelessWidget {
  final dynamic order;

  const ProfessionalOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final isDelivered = order.deliveryStatus == "Delivered";
    final isPending = order.deliveryStatus == "Pending";
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            if (isPending) {
              context.navigateTo(OrderTrackingRoute(orderId: order.orderId));
            } else {
              context.navigateTo(OrderReportingRoute(orderId: order.orderId));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order Header
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4F46E5).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.receipt_long,
                        color: Color(0xFF4F46E5),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order #${order.orderId}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          const SizedBox(height: 4),
                          OrderStatusChip(status: order.deliveryStatus),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isDelivered 
                          ? const Color(0xFF10B981).withOpacity(0.1)
                          : const Color(0xFFF59E0B).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        isDelivered ? Icons.check_circle : Icons.schedule,
                        color: isDelivered 
                          ? const Color(0xFF10B981)
                          : const Color(0xFFF59E0B),
                        size: 20,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Divider
                Container(
                  height: 1,
                  color: const Color(0xFFE5E7EB),
                ),
                
                const SizedBox(height: 16),
                
                // Cart Items
                if (order.cartData != null && order.cartData!.isNotEmpty) ...[
                  Row(
                    children: [
                      const Icon(
                        Icons.shopping_bag_outlined,
                        color: Color(0xFF6B7280),
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${order.cartData!.length} Test${order.cartData!.length > 1 ? 's' : ''} Ordered',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...order.cartData!.asMap().entries.map((entry) {
                    final index = entry.key;
                    final cartItem = entry.value;
                    return CartItemTile(
                      cartItem: cartItem,
                      index: index + 1,
                    );
                  }).toList(),
                  const SizedBox(height: 16),
                ],
                
                // Total Price Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4F46E5).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Amount',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF374151),
                        ),
                      ),
                      Text(
                        '₹${order.totalPrice}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4F46E5),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Action Hint
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.touch_app,
                      size: 16,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isPending ? 'Tap to track order' : 'Tap to view report',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartItemTile extends StatelessWidget {
  final dynamic cartItem;
  final int index;

  const CartItemTile({
    super.key,
    required this.cartItem,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF4F46E5).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  color: Color(0xFF4F46E5),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.testName ?? 'Test',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '₹${cartItem.unitPrice}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xFF9CA3AF),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Qty: ${cartItem.quantity}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            '₹${cartItem.subtotal}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF059669),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderStatusChip extends StatelessWidget {
  final String status;

  const OrderStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final isDelivered = status == "Delivered";
    final isPending = status == "Pending";
    
    Color backgroundColor;
    Color textColor;
    String displayText;
    
    if (isDelivered) {
      backgroundColor = const Color(0xFF10B981).withOpacity(0.1);
      textColor = const Color(0xFF059669);
      displayText = 'Delivered';
    } else if (isPending) {
      backgroundColor = const Color(0xFFF59E0B).withOpacity(0.1);
      textColor = const Color(0xFFD97706);
      displayText = 'Pending';
    } else {
      backgroundColor = const Color(0xFF6B7280).withOpacity(0.1);
      textColor = const Color(0xFF4B5563);
      displayText = status;
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        displayText,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}

class EmptyOrdersWidget extends StatelessWidget {
  const EmptyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: const Color(0xFF4F46E5).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              size: 64,
              color: Color(0xFF4F46E5),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'No Orders Yet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your order history will appear here\nonce you place your first order.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => context.pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4F46E5),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Start Shopping',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}