import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/bootstrap.dart';
import 'package:diagnostic_app/core/router/router.gr.dart';
import 'package:diagnostic_app/features/signup_page/controller/signup_user_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Shared Status Enum
enum AuthStatus { idle, loading, success, error }

// Generic Auth State
class AuthState {
  final AuthStatus status;
  final String? error;

  const AuthState({this.status = AuthStatus.idle, this.error});

  AuthState copyWith({AuthStatus? status, String? error}) {
    return AuthState(
      status: status ?? this.status,
      error: error,
    );
  }
}

// Signup Notifier without Unique ID
class SignupNotifier extends StateNotifier<AuthState> {
  SignupNotifier() : super(const AuthState());

  Future<void> signup({
    required String fName,
    required String lName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required String address,
    required String city,
    required String geoState,
    required String zip,
    WidgetRef? ref,
  }) async {
    state = state.copyWith(status: AuthStatus.loading);

    await ref!.read(signupUserProvider(
      SignupUserData(
        fName: fName, 
        lName: lName, 
        email: email, 
        phone: phone, 
        password: password, 
        confirmPassword: confirmPassword, 
        address: address, 
        city: city, 
        state: geoState, 
        zip: zip, 
        uniqueId: "1111111"
      )
    ).future);

    //await Future.delayed(const Duration(seconds: 2)); // simulate API call

    // dummy checks
    talker.debug("$password, $confirmPassword");
    if (password != confirmPassword) {
      state = state.copyWith(status: AuthStatus.error, error: 'Passwords do not match');
    } else if (email.endsWith('@example.com')) {
      state = state.copyWith(status: AuthStatus.error, error: 'Email already in use');
    } else {
      state = state.copyWith(status: AuthStatus.success);
    }
  }

  void reset() => state = const AuthState();
}

final signupProvider = StateNotifierProvider<SignupNotifier, AuthState>((ref) => SignupNotifier());

// Signup Page using Form onSaved (Unique ID removed)

@RoutePage()
class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  late AnimationController _animController;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _opacityAnim = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    talker.debug("Hello");
    _formKey.currentState!.save();
    await ref.read(signupProvider.notifier).signup(
      fName: _formData['fName']!,
      lName: _formData['lName']!,
      email: _formData['email']!,
      phone: _formData['phone']!,
      password: _formData['password']!,
      confirmPassword: _formData['confirmPassword']!,
      address: _formData['address']!,
      city: _formData['city']!,
      geoState: _formData['state']!,
      zip: _formData['zip']!,
      ref: ref,
    );

    if (ref.read(signupProvider).status == AuthStatus.success) {
      context.navigateTo(ActionStatusRoute(isSuccess: true, message : "User Signed Up Successfully."));
      //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User signed up successfully")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final signupState = ref.watch(signupProvider);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade900, Colors.teal.shade300],
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Create Account',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal.shade800),
                        ),
                        const SizedBox(height: 16),
                        // First & Last Name
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(labelText: 'First Name'),
                                validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                                onSaved: (v) => _formData['fName'] = v!,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(labelText: 'Last Name'),
                                validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                                onSaved: (v) => _formData['lName'] = v!,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
                          validator: (v) => (v == null || !v.contains('@')) ? 'Enter a valid email' : null,
                          onSaved: (v) => _formData['email'] = v!,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(labelText: 'Phone', prefixIcon: Icon(Icons.phone)),
                          validator: (v) => (v == null || v.length < 10) ? 'Enter valid phone' : null,
                          onSaved: (v) => _formData['phone'] = v!,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock)),
                          validator: (v) => (v == null || v.length < 6) ? 'Min 6 characters' : null,
                          onSaved: (v) => _formData['password'] = v!,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(labelText: 'Confirm Password', prefixIcon: Icon(Icons.lock_outline)),
                          //validator: (v) => (v != _formData['password']) ? 'Passwords must match' : null,
                          onSaved: (v) => _formData['confirmPassword'] = v!,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Address'),
                          validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                          onSaved: (v) => _formData['address'] = v!,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(labelText: 'City'),
                                validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                                onSaved: (v) => _formData['city'] = v!,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(labelText: 'State'),
                                validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                                onSaved: (v) => _formData['state'] = v!,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'ZIP'),
                          validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                          onSaved: (v) => _formData['zip'] = v!,
                        ),
                        const SizedBox(height: 24),
                        if (signupState.status == AuthStatus.error)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Text(signupState.error ?? '', style: const TextStyle(color: Colors.red)),
                          ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                            onPressed: () async {
                              if(signupState.status != AuthStatus.loading) {
                                _submit();
                              }
                            },
                            child: signupState.status == AuthStatus.loading
                                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(Colors.white)))
                                : const Text('Sign Up', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextButton(onPressed: () { _formKey.currentState!.reset(); ref.read(signupProvider.notifier).reset(); }, child: const Text('Reset')),
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
}
