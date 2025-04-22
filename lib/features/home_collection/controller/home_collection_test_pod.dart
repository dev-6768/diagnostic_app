// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diagnostic_app/data/model/home_collection_test_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';

final homeCollectionTestBookingProvider =
    FutureProvider.autoDispose.family<HomeCollectionBookingTestModel, HomeCollectionBookingTestData>(
  (ref, homeCollectionBookingTestData) async {
    final result = await ref.watch(apiHelperProvider).homeCollectionTestBooking(
      name : homeCollectionBookingTestData.name,
      email: homeCollectionBookingTestData.email,
      phone: homeCollectionBookingTestData.phone,
      testName: homeCollectionBookingTestData.testName
    );

    return result.when(
      (homeCollectionBookingTestResponse) async {
        //ref.invalidate(loginProvider);
        return homeCollectionBookingTestResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "homeCollectionTestBookingProvider",
);


class HomeCollectionBookingTestData {
  final String name;
  final String email;
  final String phone;
  final String testName;
  const HomeCollectionBookingTestData({
    required this.name,
    required this.email,
    required this.phone,
    required this.testName,
  });


  @override
  bool operator ==(covariant HomeCollectionBookingTestData other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.testName == testName;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ phone.hashCode ^ testName.hashCode;
}