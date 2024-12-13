import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _assetImage = 'assets/imgs/azul.png';
  double _size = 9.0;

  String get assetImage {
    return _assetImage;
  }

  double get size {
    return _size;
  }

  set assetImage(String img) {
    _assetImage = img;
    notifyListeners();
  }

  set size(double size) {
    _size = size;
    notifyListeners();
  }
}
