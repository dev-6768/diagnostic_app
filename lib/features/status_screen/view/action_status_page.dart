import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class ActionStatusPage extends StatelessWidget {
  final bool isSuccess;
  final String title;
  final String message;
  const ActionStatusPage({
    super.key, 
    this.isSuccess = true, 
    this.title = "Success", 
    this.message = "You have successfully completed this action."
  });

  @override
  Widget build(BuildContext context) {
    return ActionStatusScreen(
      isSuccess: isSuccess,
      title: title,
      message: message,
    );
  }
}



class ActionStatusScreen extends StatelessWidget {
  final bool isSuccess;
  final String title;
  final String message;

  const ActionStatusScreen({
    super.key,
    required this.isSuccess,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isSuccess ? Colors.green : Colors.red;
    final IconData iconData = isSuccess ? Icons.check : Icons.close;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: bgColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: bgColor.withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Icon(
                    iconData,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 32),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: bgColor,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text("Close"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
