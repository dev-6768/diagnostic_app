import 'package:diagnostic_app/features/contact_details/view/contact_details_page.dart';
import 'package:diagnostic_app/features/contact_details/view/widget/contact_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String address;
  final IconData icon;

  const AddressCard({
    super.key,
    required this.title,
    required this.address,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              address,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.map, size: 18),
                  label: const Text('View on Map'),
                  onPressed: () => ContactUtils.openMap(address),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  icon: const Icon(Icons.content_copy, size: 18),
                  label: const Text('Copy'),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: address));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Address copied to clipboard'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
