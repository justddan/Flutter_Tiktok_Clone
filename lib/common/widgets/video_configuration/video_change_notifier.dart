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

final videoChangeNotifier = ValueNotifier(false);
