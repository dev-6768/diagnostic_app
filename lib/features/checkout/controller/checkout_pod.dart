// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diagnostic_app/data/model/checkout_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';

final checkoutUserProvider =
    FutureProvider.autoDispose.family<CheckoutModel, CheckoutUserData>(
  (ref, checkoutUserData) async {
    final result = await ref.watch(apiHelperProvider).checkoutAction(
      fName: checkoutUserData.fName,
      lName: checkoutUserData.lName,
      email: checkoutUserData.email,
      phone: checkoutUserData.phone,
      address: checkoutUserData.address,
      city: checkoutUserData.city,
      state: checkoutUserData.state,
    );

    return result.when(
      (changePasswordResponse) async {
        //ref.invalidate(loginProvider);
        return changePasswordResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "checkoutUserProvider",
);


class CheckoutUserData {
  final String fName;
  final String lName;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String state;

  const CheckoutUserData({
    required this.fName,
    required this.lName,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
  });


  @override
  bool operator ==(covariant CheckoutUserData other) {
    if (identical(this, other)) return true;
  
    return 
      other.fName == fName &&
      other.lName == lName &&
      other.phone == phone &&
      other.email == email &&
      other.address == address &&
      other.city == city &&
      other.state == state;
  }

  @override
  int get hashCode => fName.hashCode ^ lName.hashCode ^ phone.hashCode ^ email.hashCode ^ address.hashCode ^ city.hashCode ^ state.hashCode;
}