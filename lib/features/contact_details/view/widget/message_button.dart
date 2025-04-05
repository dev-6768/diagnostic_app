import 'package:diagnostic_app/features/contact_details/view/contact_details_page.dart';
import 'package:diagnostic_app/features/contact_details/view/widget/message_dialog.dart';
import 'package:flutter/material.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MessageDialog();
            },
          );
        },
        icon: const Icon(Icons.message),
        label: const Text('Send us a Message'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}
