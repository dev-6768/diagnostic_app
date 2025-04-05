import 'package:diagnostic_app/data/model/carousel_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final carouselBannerProvider = FutureProvider.autoDispose<CarouselModel>(
  (ref) async {
    final result = await ref.watch(apiHelperProvider).getCarousel();
    return result.when(
      (carouselModelResponse) async {
        return carouselModelResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "carouselBannerProvider",
);
