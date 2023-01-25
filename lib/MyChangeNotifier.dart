import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'ModelOfHomepage.dart';

class MyChangeNotifier extends StateNotifier<ModelOfHomepage> {
  MyChangeNotifier(super.state);
  static const Color stylePressed = Color.fromARGB(255, 235, 181, 99);
  static const Color styleNotPressed = Color.fromARGB(255, 100, 193, 236);
  int get current => state.current;
  int get multiplicateur => state.current;

  void getMultiple(int value1, int value2) {
    int result = (value1 * value2);
    state = state.copyWith(current: result);
  }

  void getDivivsion(int value1, int value2) {
    int result = (value1 / value2).round();
    if (result == 0) result = 1;
    state = state.copyWith(current: result);
  }

  void setMultiple(int coef) {
    debugPrint(state.multiplicateur.toString());
    state = state.copyWith(multiplicateur: coef);
    debugPrint(state.multiplicateur.toString());
  }

  void refrecheStyleButton(int coef) {
    if (coef == 2) {
      state = state.copyWith(
          buttonColor1: stylePressed,
          buttonColor2: styleNotPressed,
          buttonColor3: styleNotPressed);
    }
    if (coef == 3) {
      state = state.copyWith(
          buttonColor1: styleNotPressed,
          buttonColor2: stylePressed,
          buttonColor3: styleNotPressed);
    }
    if (coef == 5) {
      state = state.copyWith(
          buttonColor1: styleNotPressed,
          buttonColor2: styleNotPressed,
          buttonColor3: stylePressed);
    }
  }

  Color getButtonColor(int coef) {
    if (coef == 2) return state.buttonColor1;
    if (coef == 3) return state.buttonColor2;
    return state.buttonColor3;
  }
}
