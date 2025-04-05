import 'package:diagnostic_app/data/model/about_us_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aboutUsProvider = FutureProvider.autoDispose<AboutUsModel>(
  (ref) async {
    final result = await ref.watch(apiHelperProvider).getAboutUs();
    return result.when(
      (aboutUsModel) async {
        return aboutUsModel;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "aboutUsProvider",
);
