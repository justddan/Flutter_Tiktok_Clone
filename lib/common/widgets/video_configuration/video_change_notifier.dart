import 'package:flutter/material.dart';
/*
class VideoChangeNotifier extends ChangeNotifier {
  bool autoMute = true;

  void toggleAutoMute() {
    autoMute = !autoMute;
    notifyListeners();
  }
}

final videoChangeNotifier = VideoChangeNotifier();
*/

// final videoChangeNotifier = ValueNotifier(false);

class VideoChangeNotifier extends ChangeNotifier {
  bool isMuted = false;
  bool isAutoPlay = false;

  void toggleIsMuted() {
    isMuted = !isMuted;
    notifyListeners();
  }

  void toggleIsAutoPlay() {
    isAutoPlay = !isAutoPlay;
    notifyListeners();
  }
}
