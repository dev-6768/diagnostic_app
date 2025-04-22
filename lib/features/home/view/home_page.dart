import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:diagnostic_app/bootstrap.dart';
import 'package:diagnostic_app/const/app_urls.dart';
import 'package:diagnostic_app/const/styles/app_colors.dart';
import 'package:diagnostic_app/core/router/router.gr.dart';
import 'package:diagnostic_app/features/cart/controller/pod/cart_notifier_pod.dart';
import 'package:diagnostic_app/features/home/controller/notifier/expandable_controller.dart';
import 'package:diagnostic_app/features/home/controller/pod/carousel_banner_pod.dart';
import 'package:diagnostic_app/features/home/controller/pod/pathology_test_pod.dart';
import 'package:diagnostic_app/features/home/controller/pod/view_cart_pod.dart';
import 'package:diagnostic_app/features/home/view/widget/expandable_routine_test_widget.dart';
import 'package:diagnostic_app/features/home/view/widget/home_page_carousel_widget.dart';
import 'package:diagnostic_app/features/terms_and_conditions/controller/pod/about_us_pod.dart';
import 'package:diagnostic_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final ExpandableController _controller = ExpandableController();
  int? expandedCardIndex;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int cartItemsCount = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.kDeepGreen,
                ),
                child: Text(
                  'Sanitas Health',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              Consumer(builder: (context, ref, child) {
                final aboutUsAsync = ref.watch(aboutUsProvider);
                return aboutUsAsync.easyWhen(data: (aboutUsModel) {
                  return ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About Us'),
                    onTap: () {
                      // Navigate to About
                      context.navigateTo(
                        TermsAndConditionRoute(contentBody: aboutUsModel.contentData.content),
                      );
                    },
                  );
                });
              }),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Contact Us'),
                onTap: () {
                  // Navigate to Settings
                  context.navigateTo(
                    ContactDetailsRoute(),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            // cart button
            Consumer(
              builder: (context, ref, child) {
                final viewCartAsync = ref.watch(viewCartProvider);
                return viewCartAsync.easyWhen(data: (viewCartModel) {
                  return Badge(
                    label: Text(viewCartModel.cartData.length.toString()),
                    backgroundColor: AppColors.kErrorColor,
                    child: IconButton(
                      onPressed: () {
                        context.navigateTo(
                          CartRoute(
                            cartItems: viewCartModel.cartData,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: AppColors.kBlackColor,
                      ),
                    ),
                  );
                });
              },
            ),

            const SizedBox(width: 10),
          ],
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                "Sanitas Health",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Divider(
                color: Colors.black,
                height: 1,
                thickness: 1,
                endIndent: 400,
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 20,
              children: [
                //carousel
                Consumer(
                  builder: (context, ref, child) {
                    final carouselAsync = ref.watch(carouselBannerProvider);

                    return carouselAsync.easyWhen(
                      data: (carouselModel) {
                        return HomePageCarouselWidget(
                          items: carouselModel.bannerData,
                        );
                      },
                    );
                  },
                ),
                Text(
                  'Routine Test',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ).objectCenterLeft(),
                //routine test
                ExpandableRoutineTestGrid(),
                Text(
                  'Pathology Test',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ).objectCenterLeft(),
                //patho test
                Consumer(
                  builder: (context, ref, child) {
                    final pathologyTestAsync = ref.watch(pathologyTestProvider);
                    return pathologyTestAsync.easyWhen(
                      data: (pathologyTestModel) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start, // important
                            children: List.generate(
                              pathologyTestModel.pathologyTestData.length,
                              (index) {
                                final testData = pathologyTestModel.pathologyTestData[index];
                                final isExpanded = expandedCardIndex == index;

                                return Card(
                                  surfaceTintColor: AppColors.kDeepGreen,
                                  color: AppColors.kDeepGreen,
                                  elevation: 3,
                                  child: Container(
                                    width: 300,
                                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Image
                                          CachedNetworkImage(
                                            imageUrl:
                                                "${AppUrls.imgBaseUrlForPathoTest}${testData.testPhoto}",
                                            width: double.infinity,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(height: 12),

                                          // Title + Add to cart
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  testData.testName,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppColors.kWhiteColor),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  print('Item added to cart');
                                                  talker.debug("Response : hello added item");
                                                  final response = ref
                                                      .read(cartNotifierProvider.notifier)
                                                      .addToCart(
                                                          [1, int.tryParse(testData.price) ?? 0]);
                                                  talker.debug("Response : $response");
                                                },
                                                icon: const Icon(
                                                  Icons.add_shopping_cart_sharp,
                                                  color: AppColors.kWhiteColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),

                                          // Price
                                          Text(
                                            '₹${testData.price}',
                                            style: const TextStyle(
                                                fontSize: 14, color: AppColors.kWhiteColor),
                                          ),
                                          Text(
                                            '₹${testData.originalPrice}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              decoration: TextDecoration.lineThrough,
                                            ),
                                          ),
                                          const SizedBox(height: 8),

                                          // Package details header
                                          Row(
                                            children: [
                                              const Text(
                                                'Tests',
                                                style: TextStyle(
                                                    fontSize: 14, color: AppColors.kWhiteColor),
                                              ),
                                              const Spacer(),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    expandedCardIndex = isExpanded ? null : index;
                                                  });
                                                },
                                                child: Text(
                                                  isExpanded ? 'View Less' : 'View More',
                                                  style: TextStyle(color: AppColors.kWhiteColor),
                                                ),
                                              ),
                                            ],
                                          ),

                                          // Expandable Section
                                          AnimatedSize(
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                            child: isExpanded
                                                ? Wrap(
                                                    spacing: 5,
                                                    runSpacing: 10,
                                                    children:
                                                        testData.packages.map((packageDetails) {
                                                      return Container(
                                                        padding: const EdgeInsets.symmetric(
                                                            vertical: 5, horizontal: 10),
                                                        decoration: BoxDecoration(
                                                          border:
                                                              Border.all(color: AppColors.kGrey300),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Text(
                                                          packageDetails.testName,
                                                          style: TextStyle(
                                                            color: AppColors.kWhiteColor,
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  )
                                                : const SizedBox.shrink(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
