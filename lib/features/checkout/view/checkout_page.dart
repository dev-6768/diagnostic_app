import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/bootstrap.dart';
import 'package:diagnostic_app/core/router/router.gr.dart';
import 'package:diagnostic_app/data/model/login_page_model.dart';
import 'package:diagnostic_app/features/checkout/controller/checkout_pod.dart';
import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkoutFormProvider = StateNotifierProvider<CheckoutFormNotifier, Map<String, String>>(
  (ref) => CheckoutFormNotifier(),
);


class CheckoutFormNotifier extends StateNotifier<Map<String, String>> {
  CheckoutFormNotifier() : super({});

  void updateField(String key, String value) {
    state = {...state, key: value};
  }

  void reset() => state = {};
}

@RoutePage()
class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({super.key});

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late AnimationController _animController;
  late Animation<double> _opacityAnim;

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
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final formData = ref.read(checkoutFormProvider);
      await ref.read(checkoutUserProvider(
        CheckoutUserData(
          fName: formData["fName"] ?? "Unknown", 
          lName: formData["lName"] ?? "Unknown", 
          email: formData["email"] ?? "Anonymous", 
          phone: formData["phone"] ?? "1111111111", 
          address: formData["address"] ?? "Address", 
          city: formData["city"] ?? "city", 
          state: formData["state"] ?? "state"
        )
      ).future);

      context.navigateTo(ActionStatusRoute(isSuccess: true, message : "Order placed successfully."));

      //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Order placed successfully.")));

      talker.debug(formData);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Billing Information',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 24),
                        _buildTextField(
                          'First Name', 
                          'fName', 
                          (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].fname ?? ""
                        ),

                        _buildTextField(
                          'Last Name', 
                          'lName', 
                          (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].lname ?? ""
                        ),

                        _buildTextField(
                          'Email', 
                          'email', 
                          (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].email ?? "", keyboardType: TextInputType.emailAddress
                        ),

                        _buildTextField(
                          'Phone', 
                          'phone', 
                          (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].phone ?? "", keyboardType: TextInputType.phone
                        ),

                        _buildTextField(
                          'Address', 
                          'address', 
                          (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].address ?? ""
                        ),

                        _buildTextField(
                          'City', 
                          'city', 
                          (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].city ?? ""
                        ),

                        _buildTextField(
                          'State', 
                          'state', 
                          (ref.read(userDetailsProvider.notifier).getLoginDetails().loginData ?? [LoginDatum()])[0].geoState ?? ""
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Submit', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String key,
       String initialText, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: TextEditingController(text: initialText),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.person),
        ),
        validator: (value) => value == null || value.isEmpty ? 'Required' : null,
        onSaved: (value) => ref.read(checkoutFormProvider.notifier).updateField(key, value!),
      ),
    );
  }
}