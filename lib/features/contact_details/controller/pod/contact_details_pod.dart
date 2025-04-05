import 'package:diagnostic_app/data/model/contact_details_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactDetailsProvider = FutureProvider.autoDispose<ContactDetailsModel>(
  (ref) async {
    final result = await ref.watch(apiHelperProvider).getContactDetails();
    return result.when(
      (contactDetailsModel) async {
        return contactDetailsModel;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "contactDetailsProvider",
);
