// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diagnostic_app/data/model/appointment_booking_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';

final userAppointmentBookingProvider =
    FutureProvider.autoDispose.family<AppointmentBookingModel, UserAppointmentBookingData>(
  (ref, changePassword) async {
    final result = await ref.watch(apiHelperProvider).appointmentBooking(
      name : changePassword.name,
      email: changePassword.email,
      phone: changePassword.phone,
      doctorName: changePassword.doctorName,
      date: changePassword.date,
    );

    return result.when(
      (changePasswordResponse) async {
        //ref.invalidate(loginProvider);
        return changePasswordResponse;
      },
      (error) => throw (error.errorMessage),
    );
  },
  name: "userAppointmentBookingProvider",
);


class UserAppointmentBookingData {
  final String name;
  final String email;
  final String phone;
  final String doctorName;
  final String date;
  const UserAppointmentBookingData({
    required this.name,
    required this.email,
    required this.phone,
    required this.doctorName,
    required this.date,
  });


  @override
  bool operator ==(covariant UserAppointmentBookingData other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.doctorName == doctorName &&
      other.date == date;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ phone.hashCode ^ doctorName.hashCode ^ date.hashCode;
}