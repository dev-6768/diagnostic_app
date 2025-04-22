// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diagnostic_app/data/model/home_collection_booking_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';

final homeCollectionBookingProvider =
    FutureProvider.autoDispose.family<HomeCollectionBookingModel, HomeCollectionBookingData>(
  (ref, homeCollectionBookingData) async {
    final result = await ref.watch(apiHelperProvider).homeCollectionBooking(
      name : homeCollectionBookingData.name,
      email: homeCollectionBookingData.email,
      phone: homeCollectionBookingData.phone,
    );

    return result.when(
      (homeCollectionBookingResponse) async {
        //ref.invalidate(loginProvider);
        return homeCollectionBookingResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "homeCollectionBookingProvider",
);


class HomeCollectionBookingData {
  final String name;
  final String email;
  final String phone;
  const HomeCollectionBookingData({
    required this.name,
    required this.email,
    required this.phone,
  });


  @override
  bool operator ==(covariant HomeCollectionBookingData other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.phone == phone;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ phone.hashCode;
}