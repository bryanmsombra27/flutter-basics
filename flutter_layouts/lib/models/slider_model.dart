import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0;

  double get currentPage {
    return _currentPage;
  }

  set currentPage(double page) {
    _currentPage = page;
    notifyListeners();
  }
}
