import 'package:flutter/material.dart';


class Appcontroller extends ChangeNotifier{
  static final Appcontroller instance = Appcontroller();

  bool splashCompleted = false;

  void completeSplash(){
    splashCompleted = true;
    notifyListeners();
  }
}