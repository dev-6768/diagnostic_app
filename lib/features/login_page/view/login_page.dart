// import 'package:auto_route/auto_route.dart';
// import 'package:diagnostic_app/core/router/router.gr.dart';
// import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // Login Page Widget
// @RoutePage()
// class LoginPage extends ConsumerStatefulWidget {
//   const LoginPage({super.key});

//   @override
//   ConsumerState<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends ConsumerState<LoginPage>
//     with SingleTickerProviderStateMixin {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _emailController;
//   late TextEditingController _passwordController;
//   late AnimationController _animController;
//   late Animation<double> _opacityAnim;

//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//     _animController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//     _opacityAnim = CurvedAnimation(
//       parent: _animController,
//       curve: Curves.easeIn,
//     );
//     _animController.forward();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _animController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final loginState = ref.watch(loginProvider);

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blue.shade900, Colors.blue.shade300],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: FadeTransition(
//           opacity: _opacityAnim,
//           child: Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(24.0),
//               child: Card(
//                 elevation: 8,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 24.0, vertical: 32.0),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'Welcome Back',
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue.shade800,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         TextFormField(
//                           controller: _emailController,
//                           keyboardType: TextInputType.phone,
//                           decoration: const InputDecoration(
//                             labelText: 'Phone',
//                             prefixIcon: Icon(Icons.phone),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your Phone';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 16),
//                         TextFormField(
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             labelText: 'Password',
//                             prefixIcon: Icon(Icons.lock),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 24),
//                         if (loginState.status == LoginStatus.error)
//                           Padding(
//                             padding: const EdgeInsets.only(bottom: 12.0),
//                             child: Text(
//                               loginState.error ?? '',
//                               style: const TextStyle(
//                                   color: Colors.red, fontSize: 14),
//                             ),
//                           ),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 14),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             onPressed: loginState.status ==
//                                     LoginStatus.loading
//                                 ? null
//                                 : () async {
//                                     if (_formKey.currentState!
//                                         .validate()) {
//                                       await ref
//                                           .read(loginProvider.notifier)
//                                           .login(
//                                             _emailController.text,
//                                             _passwordController.text,
//                                             "1111111",
//                                             ref
//                                           );

//                                       if (ref.read(loginProvider).status ==
//                                           LoginStatus.success) {
//                                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User logged in successfully")));
//                                         Navigator.of(context).pop();
//                                       }
//                                     }
//                                   },
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 8.0),
//                               child: loginState.status ==
//                                       LoginStatus.loading
//                                   ? const SizedBox(
//                                       height: 20,
//                                       width: 20,
//                                       child: CircularProgressIndicator(
//                                         strokeWidth: 2,
//                                         valueColor:
//                                             AlwaysStoppedAnimation(
//                                                 Colors.white),
//                                       ),
//                                     )
//                                   : const Text(
//                                       'Login',
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         TextButton(
//                           onPressed: () {
//                             ref.read(loginProvider.notifier).reset();
//                             context.navigateTo(ForgotPasswordRoute());
//                           },
//                           child: const Text('Forgot Password?'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/core/router/router.gr.dart';
import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  final VoidCallback? onLoginSuccess; // ✅ Accept callback

  const LoginPage({super.key, this.onLoginSuccess});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late AnimationController _animController;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
    _emailController.dispose();
    _passwordController.dispose();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);

    return Scaffold(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            prefixIcon: Icon(Icons.phone),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Phone';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        if (loginState.status == LoginStatus.error)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Text(
                              loginState.error ?? '',
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 14),
                            ),
                          ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: loginState.status == LoginStatus.loading
                                ? null
                                : () async {
                                    if (_formKey.currentState!.validate()) {
                                      await ref
                                          .read(loginProvider.notifier)
                                          .login(
                                            _emailController.text,
                                            _passwordController.text,
                                            "1111111",
                                            ref,
                                          );

                                      if (ref.read(loginProvider).status ==
                                          LoginStatus.success) {
                                        
                                        // ScaffoldMessenger.of(context).showSnackBar(
                                        //   const SnackBar(
                                        //     content: Text(
                                        //         "User logged in successfully"),
                                        //   ),
                                        // );

                                        widget.onLoginSuccess?.call(); // ✅ Call post-login
                                        Navigator.of(context).pop(); // ✅ Return to previous screen
                                      }
                                    }
                                  },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: loginState.status == LoginStatus.loading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation(Colors.white),
                                      ),
                                    )
                                  : const Text(
                                      'Login',
                                      style: TextStyle(fontSize: 16),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            ref.read(loginProvider.notifier).reset();
                            context.navigateTo(ForgotPasswordRoute());
                          },
                          child: const Text('Forgot Password?'),
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
