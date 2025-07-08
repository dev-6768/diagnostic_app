// import 'package:auto_route/auto_route.dart';
// import 'package:diagnostic_app/data/model/login_page_model.dart';
// import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
// import 'package:diagnostic_app/features/order_tracking/controller/order_tracking_pod.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// @RoutePage()
// class OrderTrackingPage extends StatelessWidget {
//   final String orderId;
//   const OrderTrackingPage({super.key, required this.orderId});

//   @override
//   Widget build(BuildContext context) {
//     return OrderTrackingView(orderId: orderId);
//   }
// }


// class OrderTrackingView extends ConsumerStatefulWidget {
//   final String orderId;
//   const OrderTrackingView({super.key, required this.orderId});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _OrderTrackingViewState();
// }

// class _OrderTrackingViewState extends ConsumerState<OrderTrackingView> {

//   @override
//   Widget build(BuildContext context) {
//     final trackingAsync = ref.watch(userOrderTrackingProvider((
//         (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].userId ?? "1", 
//         widget.orderId
//       )
//     )
//   );

//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.black,
//         backgroundColor: Colors.white,

//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios_outlined,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             context.pop();
//           },
//         ),
//         title: Text(
//           "Track Order",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w500,
//           ),
//         ),          
//       ),

//       body: trackingAsync.when(
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (err, _) => Center(child: Text('Error: ${err.toString()}')),
//         data: (trackingModel) {
//           final messages = trackingModel.trackData;

//           if (messages.isEmpty) {
//             return const Center(child: Text('No tracking info available.'));
//           }

//           return Container(
//             padding: EdgeInsets.all(10),
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final track = messages[index];
//                 return Card(
//                   elevation: 10,
//                   clipBehavior: Clip.antiAlias,
//                   child: ListTile(
//                     leading: const Icon(Icons.local_shipping),
//                     title: Text(
//                       "Order Details",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     subtitle: Text(track.message),
//                     trailing: Icon(Icons.arrow_right),
//                   ),
//                 );
                
                
//               },
//             ),
//           );
          
          
//         },
//       ),
//     );
//   }
// }



import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/data/model/login_page_model.dart';
import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
import 'package:diagnostic_app/features/order_tracking/controller/order_tracking_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class OrderTrackingPage extends StatelessWidget {
  final String orderId;
  const OrderTrackingPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return ProfessionalOrderTrackingView(orderId: orderId);
  }
}

class ProfessionalOrderTrackingView extends ConsumerStatefulWidget {
  final String orderId;
  const ProfessionalOrderTrackingView({super.key, required this.orderId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfessionalOrderTrackingViewState();
}

class _ProfessionalOrderTrackingViewState extends ConsumerState<ProfessionalOrderTrackingView> {
  @override
  Widget build(BuildContext context) {
    final trackingAsync = ref.watch(userOrderTrackingProvider((
        (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].userId ?? "1", 
        widget.orderId
      )
    ));

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
                'Track Order',
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
          
          // Order ID Header
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4F46E5).withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.track_changes,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tracking Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '#${widget.orderId}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Tracking Content
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: trackingAsync.when(
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
                        'Loading tracking information...',
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
                        'Unable to load tracking info',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Please try again later',
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
              data: (trackingModel) {
                final messages = trackingModel.trackData;

                if (messages.isEmpty) {
                  return const SliverFillRemaining(
                    child: EmptyTrackingWidget(),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final track = messages[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: TrackingDetailCard(
                          track: track,
                          isLast: index == messages.length - 1,
                        ),
                      );
                    },
                    childCount: messages.length,
                  ),
                );
              },
            ),
          ),
          
          // Bottom spacing
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}

class TrackingDetailCard extends StatelessWidget {
  final dynamic track;
  final bool isLast;

  const TrackingDetailCard({
    super.key,
    required this.track,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
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
            // Handle tap if needed
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // Delivery truck icon
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.local_shipping,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                
                const SizedBox(width: 16),
                
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Details",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        track.message ?? "Only For Test",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // Arrow icon
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF9CA3AF),
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyTrackingWidget extends StatelessWidget {
  const EmptyTrackingWidget({super.key});

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
              Icons.local_shipping_outlined,
              size: 64,
              color: Color(0xFF4F46E5),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'No Tracking Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tracking details will appear here\nonce your order is processed.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              // Refresh tracking info
            },
            icon: const Icon(Icons.refresh, size: 20),
            label: const Text('Refresh'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4F46E5),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}