import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/core/router/router.gr.dart';
import 'package:diagnostic_app/data/model/login_page_model.dart';
import 'package:diagnostic_app/features/edit_profile/controller/edit_profile_pod.dart';
import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
import 'package:diagnostic_app/features/status_screen/view/action_status_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _opacityAnim;

  late TextEditingController _fnameController;
  late TextEditingController _lnameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _zipController;

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _opacityAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeIn,
    );
    _animController.forward();

    final userData = (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0];


    _fnameController = TextEditingController(text: userData.fname ?? "");
    _lnameController = TextEditingController(text: userData.lname ?? "");
    _emailController = TextEditingController(text: userData.email ?? "");
    _phoneController = TextEditingController(text: userData.phone ?? "");
    _addressController = TextEditingController(text: userData.address ?? "");
    _cityController = TextEditingController(text: userData.city ?? "");
    _stateController = TextEditingController(text: userData.geoState ?? "");
    _zipController = TextEditingController(text: userData.zip ?? "000000");

  }

  @override
  void dispose() {
    _animController.dispose();
    _fnameController.dispose();
    _lnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  Future<void> _submitEditProfile() async {
    try {
      final userId = (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].userId ?? "";

      await ref.read(editProfileProvider.notifier).submitEditProfile(
        fName: _fnameController.text,
        lName: _lnameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text,
        city: _cityController.text,
        geoState: _stateController.text,
        zip: _zipController.text,
        userId: userId,
      );

      final updatedUserLoginDetails = LoginPageModel(
        loginData: [
          LoginDatum(
            fname: _fnameController.text,
            lname: _lnameController.text,
            email: _emailController.text,
            phone: _phoneController.text,
            address: _addressController.text,
            city: _cityController.text,
            geoState: _stateController.text,
            zip: _zipController.text,
            userId: userId,
          )
        ],
        ack: 1,
        msg: "Login Details Updated Successfully!"
      );

      ref.read(userDetailsProvider.notifier).set(updatedUserLoginDetails); //to update the login details in the riverpod after updating details in the server.

      context.navigateTo(
        ActionStatusRoute(
          title: "Successfully Updated Details",
          message: "You have successfully updated the details",
        ),
      );
    }

    catch(error) {
      context.navigateTo(
        ActionStatusRoute(
          isSuccess: false,
          title: "Failed to update details.",
          message: "Could not update details, please try again later.",
        ),
      );
    }
    

    // final result = ref.read(editProfileProvider);

    // if (result is AsyncData && result.value!.isSuccess) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text("Profile updated successfully")),
    //   );
    //   setState(() {
    //     _isEditing = false;
    //   });
    // } 
    
    // else if (result is AsyncError) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text("Failed to update profile")),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(editProfileProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FadeTransition(
          opacity: _opacityAnim,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Profile Information',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 24),

                      _buildTextField('First Name', _fnameController),
                      _buildTextField('Last Name', _lnameController),
                      _buildTextField('Email', _emailController),
                      _buildTextField('Phone', _phoneController),
                      _buildTextField('Address', _addressController),
                      _buildTextField('City', _cityController),
                      _buildTextField('State', _stateController),
                      _buildTextField('ZIP', _zipController),

                      const SizedBox(height: 24),
                      if (_isEditing)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : _submitEditProfile,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: isLoading
                                ? const CircularProgressIndicator()
                                : const Text('Save Profile', style: TextStyle(fontSize: 16)),
                          ),
                        )
                      else
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => setState(() => _isEditing = true),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Edit Profile', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        readOnly: !_isEditing,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.person),
        ),
      ),
    );
  }
}
