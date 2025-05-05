import 'package:diagnostic_app/splasher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:diagnostic_app/core/local_storage/app_storage_pod.dart';

/// This entry point should be used for production only
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final box = await Hive.openBox('appBox');

  runApp(
    ProviderScope(
      overrides: [
        appBoxProvider.overrideWithValue(box),
      ],
      child: Splasher()
    ),
  );
}
