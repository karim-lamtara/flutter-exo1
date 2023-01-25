import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'MyChangeNotifier.dart';
part 'ModelOfHomepage.freezed.dart';

@freezed
class ModelOfHomepage with _$ModelOfHomepage {
  factory ModelOfHomepage(
      {@Default(1)
          required int current,
      @Default(2)
          required int multiplicateur,
      @Default(
        MyChangeNotifier.stylePressed,
      )
          required Color buttonColor1,
      @Default(
        MyChangeNotifier.styleNotPressed,
      )
          required Color buttonColor2,
      @Default(MyChangeNotifier.styleNotPressed)
          required Color buttonColor3}) = _ModelOfHomepage;
}
