// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diagnostic_app/data/model/change_password_model.dart';
import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';

final changeUserPasswordProvider =
    FutureProvider.autoDispose.family<ChangePasswordModel, ChangeUserPasswordData>(
  (ref, changePassword) async {
    final result = await ref.watch(apiHelperProvider).changePassword(
      currentPassword : changePassword.currentPassword,
      newPassword: changePassword.newPassword,
      confirmPassword: changePassword.confirmPassword,
      userId: ref.read(userDetailsProvider.notifier).getLoginDetails().loginData![0].userId ?? "0",
    );

    return result.when(
      (changePasswordResponse) async {
        //ref.invalidate(loginProvider);
        return changePasswordResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "changePasswordProvider",
);


class ChangeUserPasswordData {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;
  const ChangeUserPasswordData({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });


  @override
  bool operator ==(covariant ChangeUserPasswordData other) {
    if (identical(this, other)) return true;
  
    return 
      other.currentPassword == currentPassword &&
      other.newPassword == newPassword &&
      other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode => currentPassword.hashCode ^ newPassword.hashCode ^ confirmPassword.hashCode;
}