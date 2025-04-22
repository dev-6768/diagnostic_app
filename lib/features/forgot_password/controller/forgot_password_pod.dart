// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diagnostic_app/data/model/forgot_password_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';

final forgotUserPasswordProvider =
    FutureProvider.autoDispose.family<ForgotPasswordModel, String>(
  (ref, forgotPassword) async {
    final result = await ref.watch(apiHelperProvider).forgotPassword(
      email : forgotPassword,
    );

    return result.when(
      (forgotPasswordResponse) async {
        //ref.invalidate(loginProvider);
        return forgotPasswordResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "forgotPasswordProvider",
);
