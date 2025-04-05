import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/const/app_urls.dart';
import 'package:diagnostic_app/const/styles/app_colors.dart';
import 'package:diagnostic_app/features/add_to_cart_page/view/add_to_cart_page.dart';
import 'package:diagnostic_app/core/router/router.gr.dart';
import 'package:diagnostic_app/features/home/controller/pod/carousel_banner_pod.dart';
import 'package:diagnostic_app/features/home/controller/pod/pathology_test_pod.dart';
import 'package:diagnostic_app/features/home/controller/pod/routine_test_pod.dart';
import 'package:diagnostic_app/features/home/controller/pod/view_cart_pod.dart';
import 'package:diagnostic_app/features/home/view/widget/home_page_carousel_widget.dart';
import 'package:diagnostic_app/features/terms_and_conditions/controller/pod/about_us_pod.dart';
import 'package:diagnostic_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:diagnostic_app/shared/widget/cache_network_image_widget.dart';
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
  int cartItemsCount = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            // cart button
            Consumer(
              builder: (context, ref, child) {
                final viewCartAsync = ref.watch(viewCartProvider);
                return viewCartAsync.easyWhen(data: (viewCartModel) {
                  return Badge(
                    label: Text(cartItemsCount.toString()),
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
            //a popup menu button that shows options
            Consumer(
              builder: (context, ref, child) {
                final aboutUsAsync = ref.watch(aboutUsProvider);
                return aboutUsAsync.easyWhen(data: (aboutUsModel) {
                  return PopupMenuButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: AppColors.kBlackColor,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {
                          context.navigateTo(
                            TermsAndConditionRoute(contentBody: aboutUsModel.contentData.content),
                          );
                        },
                        child: const Text('About Us'),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          context.navigateTo(
                            ContactDetailsRoute(),
                          );
                        },
                        child: const Text('Contact Us'),
                      ),
                    ],
                  );
                });
              },
            ),
          ],
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                "Home",
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddToCartPage())
                );
              },
              icon: Icon(Icons.shopping_cart)
            ),
          ],
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
                Consumer(
                  builder: (context, ref, child) {
                    final routineTestAsync = ref.watch(routineTestProvider);
                    return routineTestAsync.easyWhen(
                      data: (routineTestModel) {
                        return SizedBox(
                          height: 500,
                          child: ListView.builder(
                            primary: false,
                            itemCount: routineTestModel.routineTestData.length,
                            // physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(routineTestModel.routineTestData[index].testName),
                                subtitle: Column(
                                  spacing: 2,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('₹${routineTestModel.routineTestData[index].price}'),
                                    Text(
                                      '₹${routineTestModel.routineTestData[index].originalPrice}',
                                      style: TextStyle(
                                        color: AppColors.kGrey400,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                                leading: Text(
                                  '${routineTestModel.routineTestData[index].testId}.',
                                ),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_shopping_cart_sharp),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
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
                        return SizedBox(
                          height: 500,
                          child: ListView.builder(
                            primary: false,
                            itemCount: pathologyTestModel.pathologyTestData.length,
                            // physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  spacing: 2,
                                  children: [
                                    Text(
                                        '${pathologyTestModel.pathologyTestData[index].packageId}. '),
                                    Flexible(
                                      child: Text(
                                        pathologyTestModel.pathologyTestData[index].testName,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  spacing: 2,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('₹${pathologyTestModel.pathologyTestData[index].price}'),
                                    Text(
                                      '₹${pathologyTestModel.pathologyTestData[index].originalPrice}',
                                      style: TextStyle(
                                        color: AppColors.kGrey400,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    Wrap(
                                      spacing: 5,
                                      runSpacing: 10,
                                      alignment: WrapAlignment.start,
                                      children:
                                          pathologyTestModel.pathologyTestData[index].packages.map(
                                        (packageDetails) {
                                          return Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColors.kGrey400,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Text(packageDetails.testName),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ],
                                ),
                                leading: CacheNetworkImageWidget(
                                  imageUrl:
                                      '${AppUrls.imgBaseUrlForPathoTest}${pathologyTestModel.pathologyTestData[index].testPhoto}',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_shopping_cart_sharp),
                                ),
                              );
                            },
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
