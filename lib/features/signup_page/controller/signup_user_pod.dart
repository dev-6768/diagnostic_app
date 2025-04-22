// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diagnostic_app/data/model/login_page_model.dart';
import 'package:diagnostic_app/data/model/signup_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';

final signupUserProvider =
    FutureProvider.autoDispose.family<SignupPageModel, SignupUserData>(
  (ref, signupUserData) async {
    final result = await ref.watch(apiHelperProvider).signupUser(
      fName: signupUserData.fName,
      lName: signupUserData.lName,
      email: signupUserData.email,
      phone: signupUserData.phone,
      password: signupUserData.password,
      confirmPassword: signupUserData.confirmPassword,
      address: signupUserData.address,
      city: signupUserData.city,
      state: signupUserData.state,
      zip: signupUserData.zip,
      uniqueId: signupUserData.uniqueId,
    );


    return result.when(
      (signupUserResponse) async {
        //ref.invalidate(loginProvider);
        return signupUserResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "signupUserProvider",
);

class SignupUserData {
  final String fName;
  final String lName;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String uniqueId;
  const SignupUserData({
    required this.fName,
    required this.lName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.address,
    required this.city, 
    required this.state,
    required this.zip,
    required this.uniqueId,
  });


  @override
  bool operator ==(covariant SignupUserData other) {
    if (identical(this, other)) return true;
  
    return 
      other.fName == fName &&
      other.lName == lName &&
      other.email == email &&
      other.phone == phone &&
      other.password == password &&
      other.confirmPassword == confirmPassword &&
      other.address == address &&
      other.city == city &&
      other.state == state &&
      other.zip == zip &&
      other.uniqueId == uniqueId;
  }

  @override
  int get hashCode => email.hashCode ^ phone.hashCode;
}
