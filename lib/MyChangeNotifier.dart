import 'package:flutter/material.dart';

class MyChangeNotifier extends ChangeNotifier {
  int current = 1;
  int multiplicateur = 2;

  final Color stylePressed = const Color.fromARGB(255, 235, 181, 99);
  final Color styleNotPressed = Color.fromARGB(255, 100, 193, 236);

  late Color buttonColor1 = stylePressed;
  late Color buttonColor2 = styleNotPressed;
  late Color buttonColor3 = styleNotPressed;

  void getMultiple() {
    current = current * multiplicateur;
    notifyListeners();
  }

  void getDivivsion() {
    current = (current / multiplicateur).round();
    if (current == 0) {
      current = 1;
    }
    notifyListeners();
  }

  void setMultiple(int multiplicateur) {
    this.multiplicateur = multiplicateur;
    notifyListeners();
  }

  void refrecheStyleButton(int coef) {
    if (coef == 2) {
      buttonColor1 = stylePressed;
      buttonColor2 = styleNotPressed;
      buttonColor3 = styleNotPressed;
    }
    if (coef == 3) {
      buttonColor1 = styleNotPressed;
      buttonColor2 = stylePressed;
      buttonColor3 = styleNotPressed;
    }
    if (coef == 5) {
      buttonColor1 = styleNotPressed;
      buttonColor2 = styleNotPressed;
      buttonColor3 = stylePressed;
    }
    notifyListeners();
  }

  Color getButtonColor(int coef) {
    if (coef == 2) return buttonColor1;
    if (coef == 3) return buttonColor2;
    return buttonColor3;
  }
}
