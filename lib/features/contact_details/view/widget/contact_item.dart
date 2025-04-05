import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Function() onTap;

  const ContactItem({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(title),
        subtitle: Text(content),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.content_copy, size: 20),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: content));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$title copied to clipboard'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(
                title == 'Email' ? Icons.send : Icons.call,
                size: 20,
                color: Colors.blue,
              ),
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
