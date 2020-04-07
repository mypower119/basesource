import 'package:base_constructor/config/language.dart';

export 'langs/en.dart';
export 'langs/vi.dart';

extension TranslateLang on String {
  String translate() {
    return lang(this);
  }
}

class R {
  static const String sminapo = "sminapo";
  static const String agree = "agree";
  static const String cancel = "cancel";
  static const String notification = "notification";
}