// lib/cart_key_screen.dart
import 'package:diagnostic_app/core/local_storage/cart_id_storage_provider.dart';
import 'package:diagnostic_app/core/local_storage/cart_key_service/cart_key_service.dart';
import 'package:diagnostic_app/data/model/login_page_model.dart';
import 'package:diagnostic_app/features/login_page/controller/login_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartKeyScreen extends ConsumerWidget {
  const CartKeyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(cartKeyServiceProvider);
    final userDetails = ref.watch(userDetailsProvider);
    return FutureBuilder(
        future: service.initializeCartKeyIfAbsent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectableText(
                  "Welcome, ${(userDetails.loginData == null || userDetails.loginData!.isEmpty ? [LoginDatum()] : userDetails.loginData)![0].fname ?? "User"}",
                  style: const TextStyle(
                    fontSize: 22,
                  )
                ),
              ],
            ),
          );
        },
      );
    // return Scaffold(
    //   appBar: AppBar(title: const Text('Cart Key Manager')),
    //   body: 
    // );
  }
}


class CartKeyViewWidget extends StatelessWidget {
  final CartKeyService service;
  final String? cartKey;
  const CartKeyViewWidget({super.key, required this.service, required this.cartKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Current Cart Key:', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 10),
          SelectableText(cartKey ?? 'No Key Found', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              await service.regenerateCartKey();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cart Key regenerated')),
              );
              //(context as Element).markNeedsBuild();
            },
            child: const Text('Regenerate Key'),
          ),
        ],
      ),
    );
  }
}