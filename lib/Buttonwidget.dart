import 'package:flutter/material.dart';

import 'MyChangeNotifier.dart';

class Buttonwidget extends StatelessWidget {
  const Buttonwidget({
    super.key,
    required this.appState,
    required this.coef,
    required this.text,
  });

  final MyChangeNotifier appState;
  final int coef;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: appState.getButtonColor(coef),
      child: InkWell(
          child: Container(
            width: 100,
            height: 30,
            alignment: Alignment.center,
            child: Text(text),
          ),
          onTap: () {
            appState.setMultiple(coef);
            appState.refrecheStyleButton(coef);
          }),
    );
  }
}
