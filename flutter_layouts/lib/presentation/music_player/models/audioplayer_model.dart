import 'package:flutter/material.dart';

class AudioplayerModel with ChangeNotifier {
  bool _playing = false;
  late AnimationController _controller;
  Duration _songDuration = const Duration(milliseconds: 0);
  Duration _currentSongDuration = const Duration(milliseconds: 0);

  String get songTotalDuration {
    return printDuration(_songDuration);
  }

  String get currentSecond {
    return printDuration(_currentSongDuration);
  }

  double get porcentaje {
    return _songDuration.inSeconds > 0
        ? _currentSongDuration.inSeconds / _songDuration.inSeconds
        : 0;
  }

  bool get playing {
    return _playing;
  }

  Duration get songDuration {
    return _songDuration;
  }

  Duration get currentSongDuration {
    return _currentSongDuration;
  }

  AnimationController get controller {
    return _controller;
  }

  set playing(bool value) {
    _playing = value;
    notifyListeners();
  }

  set controller(AnimationController value) {
    _controller = value;
    // notifyListeners();
  }

  set currentSongDuration(Duration value) {
    currentSongDuration = value;
    notifyListeners();
  }

  set songDuration(Duration value) {
    _songDuration = value;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return "0$n";
    }

    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitsMinutes:$twoDigitsSeconds";
  }
}
