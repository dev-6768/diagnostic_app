import 'package:flutter_riverpod/flutter_riverpod.dart';

final navbarSelectedIndexProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
  name: "navbarSelectedIndexProvider",
);
