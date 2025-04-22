import 'package:diagnostic_app/app/view/app.dart';
import 'package:diagnostic_app/bootstrap.dart';
import 'package:diagnostic_app/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

class Splasher extends StatelessWidget {
  const Splasher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primaryColor: Colors.blue),
      home: SplashView(
        removeSpalshLoader: false,
        onInitialized: (container) {
          bootstrap(
            () => const App(),
            parent: container,
          );
        },
      ),
    );
  }
}
