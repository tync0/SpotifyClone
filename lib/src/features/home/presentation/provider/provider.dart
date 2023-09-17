import 'package:flutter/material.dart';

class Button extends ChangeNotifier {
  bool playing = false;
  void changeState() {
    playing = !playing;
    notifyListeners();
  }
}
