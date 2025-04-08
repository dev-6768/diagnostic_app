import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/bootstrap.dart';
import 'package:diagnostic_app/const/app_urls.dart';
import 'package:diagnostic_app/const/styles/app_colors.dart';
import 'package:diagnostic_app/core/router/router.gr.dart';
import 'package:diagnostic_app/features/home/controller/pod/pathology_test_pod.dart';
import 'package:diagnostic_app/features/home/controller/pod/view_cart_pod.dart';
import 'package:diagnostic_app/features/terms_and_conditions/controller/pod/about_us_pod.dart';
import 'package:diagnostic_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:diagnostic_app/shared/widget/cache_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PathologyTestPage extends StatelessWidget {
  const PathologyTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PathologyTestView();
  }
}

class PathologyTestView extends ConsumerWidget {
  const PathologyTestView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
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
              "Pathology Test",
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
      body: Column(
        spacing: 20,
        children: [
          //patho test
          Consumer(
            builder: (context, ref, child) {
              final pathologyTestAsync = ref.watch(pathologyTestProvider);
              return pathologyTestAsync.easyWhen(
                data: (pathologyTestModel) {
                  return Expanded(
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
                              Text('${pathologyTestModel.pathologyTestData[index].packageId}. '),
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
                                children: pathologyTestModel.pathologyTestData[index].packages.map(
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
                            onPressed: () async {
                              talker.debug("Response : hello added item");
                              // final response = await ref.read(addToCartProvider([1, int.tryParse(pathologyTestModel.pathologyTestData[index].price)!]).future);
                              // talker.debug("Response : $response");
                            },
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
    );
  }
}
