import 'package:diagnostic_app/data/model/edit_profile_model.dart';
import 'package:diagnostic_app/data/network/api_helper_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileRequest {
  final String fName;
  final String lName;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String userId;

  EditProfileRequest({
    required this.fName,
    required this.lName,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.userId,
  });
}

final editProfileProvider =
    StateNotifierProvider<EditProfileNotifier, AsyncValue<EditProfileModel>>(
  (ref) => EditProfileNotifier(ref),
);

class EditProfileNotifier extends StateNotifier<AsyncValue<EditProfileModel>> {
  final Ref ref;

  EditProfileNotifier(this.ref) : super(AsyncValue.data(EditProfileModel(ack: 0, msg: "")));

  Future<void> submitEditProfile({
    required String fName,
    required String lName,
    required String email,
    required String phone,
    required String address,
    required String city,
    required String geoState,
    required String zip,
    required String userId,
  }) async {
    //state = "loading";

    final api = ref.read(apiHelperProvider);
    final result = await api.editUserProfile(
      fName: fName,
      lName: lName,
      email: email,
      phone: phone,
      address: address,
      city: city,
      state: geoState,
      zip: zip,
      userId: userId,
    );

    result.when(
      (data) async {
        //state = "success";
        return data;
      } ,
      (e) async {
        //state = "error";
        throw (e.errorMessage);
      }, 
    );
  }
}
