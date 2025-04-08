import 'package:flutter/material.dart';

class ExpandableController extends ChangeNotifier {
  int? _expandedIndex;

  int? get expandedIndex => _expandedIndex;

  void toggle(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = null;
    } else {
      _expandedIndex = index;
    }
    notifyListeners();
  }
}
