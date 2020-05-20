import 'package:flutter/material.dart';

class RemainingTime extends ChangeNotifier {
  int _currentValue = 0;

  int get remaining => _currentValue;

  void updateTime(int newValue) {
    _currentValue = newValue;
    notifyListeners();
  }
}
