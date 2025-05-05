import 'package:diagnostic_app/bootstrap.dart';
import 'package:diagnostic_app/const/styles/app_colors.dart';
import 'package:diagnostic_app/features/cart/controller/pod/cart_notifier_pod.dart';
import 'package:diagnostic_app/features/home/controller/pod/routine_test_pod.dart';
import 'package:diagnostic_app/features/home_collection/controller/home_collection_test_pod.dart';
import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
import 'package:diagnostic_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpandableRoutineTestGrid extends StatefulWidget {
  const ExpandableRoutineTestGrid({super.key});

  @override
  State<ExpandableRoutineTestGrid> createState() => _ExpandableRoutineTestGridState();
}

class _ExpandableRoutineTestGridState extends State<ExpandableRoutineTestGrid>
    with TickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final routineTestAsync = ref.watch(routineTestProvider);

        return routineTestAsync.easyWhen(
          data: (routineTestModel) {
            final totalItems = routineTestModel.routineTestData.length;
            final initialItemCount = 4;

            final displayItems = _isExpanded
                ? routineTestModel.routineTestData
                : routineTestModel.routineTestData.take(initialItemCount).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,  
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: displayItems.length,
                      itemBuilder: (context, index) {
                        final data = displayItems[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.all(8),
                          child: Container(
                            color: AppColors.kDeepGreen,
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${data.testId}.',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, color: AppColors.kWhiteColor),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data.testName,
                                  style:
                                      const TextStyle(fontSize: 16, color: AppColors.kWhiteColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Text(
                                    '₹${data.price}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.kWhiteColor,
                                    ),
                                  ),


                                  TextButton(
                                    onPressed: () {
                                      if(ref.read(userDetailsProvider.notifier).isLoggedIn()) {
                                        ref.read(homeCollectionTestBookingProvider(
                                          HomeCollectionBookingTestData(
                                            name: ref.read(userDetailsProvider.notifier).getLoginDetails().loginData![0].fname ?? "Unknown", 
                                            email: ref.read(userDetailsProvider.notifier).getLoginDetails().loginData![0].email ?? "Unknown", 
                                            phone: ref.read(userDetailsProvider.notifier).getLoginDetails().loginData![0].phone ?? "Unknown", 
                                            testName: data.testName,
                                          )
                                        ));

                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Test booked.")));
                                      }

                                      else {
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("In order to book a test, you need to login first.")));
                                      }
                                    },

                                    child: Text("Book"),
                                  ),
                                ],),
                                Row(
                                  children: [
                                    Text(
                                      '₹${data.originalPrice}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.kGrey400,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const Spacer(),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: IconButton(
                                        onPressed: () async {
                                          if(ref.read(userDetailsProvider.notifier).isLoggedIn()) {
                                            talker.debug("Response : hello added item");
                                            final response = ref
                                                .read(cartNotifierProvider.notifier)
                                                .addToCart([1, double.parse(data.price).toInt()], data.testName);
                                            talker.debug("Response : $response");
                                          }

                                          else {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("In order to add to cart, you need to login first.")));
                                          }
                                          
                                        },
                                        icon: const Icon(
                                          Icons.add_shopping_cart_sharp,
                                          color: AppColors.kWhiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (totalItems > initialItemCount)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text(
                      _isExpanded ? 'View Less' : 'View More',
                      style: TextStyle(color: AppColors.kRed500),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
