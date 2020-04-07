import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_size.dart';

class AppStyle {

  static TextStyle get styleTextNormal{
    return const TextStyle(fontSize: FontSize.normalFontSize, color: Colors.black);
  }

  static TextStyle get styleTextNormalBold {
    return const TextStyle(fontSize: FontSize.normalFontSize, color: Colors.black, fontWeight: FontWeight.bold);
  }

  static TextStyle get styleTextTitle{
    return const TextStyle(fontSize: FontSize.titleFontSize, color: Colors.black);
  }

  static TextStyle get styleTextTitleBold{
    return const TextStyle(fontSize: FontSize.titleFontSize, color: Colors.black, fontWeight: FontWeight.bold);
  }

  static TextStyle get textStyleHint{
    return const TextStyle(fontSize: FontSize.smallFontSize, color: AppColors.hintColor);
  }

  static TextStyle get textStyleHintBold{
    return const TextStyle(fontSize: FontSize.smallFontSize, color: AppColors.hintColor, fontWeight: FontWeight.bold);
  }

  static TextStyle get textStyleEvent{
    return const TextStyle(fontSize: FontSize.normalFontSize, color: AppColors.colorEvent);
  }

}