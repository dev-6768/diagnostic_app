import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/features/change_password/controller/change_password_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Change Password Status & State
enum ChangePasswordStatus { idle, loading, success, error }

class ChangePasswordState {
  final ChangePasswordStatus status;
  final String? error;

  const ChangePasswordState({this.status = ChangePasswordStatus.idle, this.error});

  ChangePasswordState copyWith({ChangePasswordStatus? status, String? error}) {
    return ChangePasswordState(
      status: status ?? this.status,
      error: error,
    );
  }
}

// Change Password Notifier & Provider
class ChangePasswordNotifier extends StateNotifier<ChangePasswordState> {
  ChangePasswordNotifier() : super(const ChangePasswordState());

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
    WidgetRef? ref,
  }) async {
    state = state.copyWith(status: ChangePasswordStatus.loading);
    await ref!.read(changeUserPasswordProvider(
      ChangeUserPasswordData(
        currentPassword: currentPassword, 
        newPassword: newPassword, 
        confirmPassword: confirmPassword
      )).future);
    //await Future.delayed(const Duration(seconds: 2)); // simulate API call

    if (newPassword != confirmPassword) {
      state = state.copyWith(status: ChangePasswordStatus.error, error: 'Passwords do not match');
    } 
    
    else {
      state = state.copyWith(status: ChangePasswordStatus.success);
    }
  }

  void reset() => state = const ChangePasswordState();
}

final changePasswordProvider = StateNotifierProvider<ChangePasswordNotifier, ChangePasswordState>(
  (ref) => ChangePasswordNotifier(),
);

// Change Password Page
@RoutePage()
class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
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
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    await ref.read(changePasswordProvider.notifier).changePassword(
      currentPassword: _formData['currentPassword']!,
      newPassword: _formData['newPassword']!,
      confirmPassword: _formData['confirmPassword']!,
      ref: ref,
    );
    if (ref.read(changePasswordProvider).status == ChangePasswordStatus.success) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password changed successfully."),));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(changePasswordProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Set a new password for your account',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue.shade800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Current Password',
                            prefixIcon: Icon(Icons.lock_outline),
                          ),
                          validator: (v) => (v == null || v.isEmpty)
                              ? 'Required'
                              : null,
                          onSaved: (v) => _formData['currentPassword'] = v!,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'New Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (v) => (v == null || v.length < 6)
                              ? 'Min 6 characters'
                              : null,
                          onSaved: (v) => _formData['newPassword'] = v!,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          // validator: (v) => (v != _formData['newPassword'])
                          //     ? 'Passwords must match'
                          //     : null,
                          onSaved: (v) => _formData['confirmPassword'] = v!,
                        ),
                        const SizedBox(height: 24),
                        if (state.status == ChangePasswordStatus.error)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Text(
                              state.error ?? '',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: state.status == ChangePasswordStatus.loading
                                ? null
                                : _submit,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: state.status == ChangePasswordStatus.loading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  )
                                : const Text(
                                    'Change Password',
                                    style: TextStyle(fontSize: 16),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ref.read(changePasswordProvider.notifier).reset();
                          },
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
}
