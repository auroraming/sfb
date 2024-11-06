/**
 *  Copyright (C) 2018-2024

 */
import 'package:flutter/material.dart';

class DetailValueChange extends ValueNotifier {
  DetailValueChange() : super(null);
  var value = 0.0;
  var tabIndex = 0;
  void changeValue(v) {
    value = v;
    notifyListeners();
  }

  void changeTabIndex(v) {
    tabIndex = v;
    notifyListeners();
  }
}