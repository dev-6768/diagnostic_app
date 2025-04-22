// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diagnostic_app/data/model/login_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';

final loginUserProvider =
    FutureProvider.autoDispose.family<LoginPageModel, LoginUserData>(
  (ref, loginUserData) async {
    final result = await ref.watch(apiHelperProvider).loginUser(
      userName: loginUserData.userName,
      password: loginUserData.password,
      uniqueId: loginUserData.uniqueId,
    );


    return result.when(
      (loginUserResponse) async {
        //ref.invalidate(loginProvider);
        return loginUserResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "loginUserProvider",
);

class LoginUserData {
  final String userName;
  final String password;
  final String uniqueId;
  const LoginUserData({
    required this.userName,
    required this.password,
    required this.uniqueId,
  });


  @override
  bool operator ==(covariant LoginUserData other) {
    if (identical(this, other)) return true;
  
    return 
      other.userName == userName &&
      other.password == password &&
      other.uniqueId == uniqueId;
  }

  @override
  int get hashCode => userName.hashCode ^ password.hashCode ^ uniqueId.hashCode;
}
