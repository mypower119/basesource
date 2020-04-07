import 'package:base_constructor/config/langs/en.dart';
import 'package:base_constructor/config/langs/vi.dart';
import 'package:base_constructor/data/constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

import 'package:shared_preferences/shared_preferences.dart';

import 'r.dart';

String lang(String id) {
  var content = LanguageUtils().multilan[LanguageUtils.langCode][id];
  return content??"???";
}

class LanguageUtils {
  static final String LANGUAGE_CODE_VI = "vi";
  static final String LANGUAGE_CODE_EN = "en";

  static String langCode = LANGUAGE_CODE_VI;

  static final LanguageUtils _singleton = LanguageUtils._internal();

  LanguageUtils._internal();

  factory LanguageUtils() {
    return _singleton;
  }

  List<LanguageModel> languages = [
    LanguageModel("Tiếng Việt", LANGUAGE_CODE_VI),
    LanguageModel("English", LANGUAGE_CODE_EN)
  ];

  String getLanguage(String id) {
    for (LanguageModel item in languages) {
      if (item.id == id) {
        return item.name;
      }
    }
    return "Tiếng Việt";
  }

  Future getLanguageLocal(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(Constants.SHARED_CURRENT_LANGUAGE)) {
      langCode = prefs.getString(Constants.SHARED_CURRENT_LANGUAGE);
    } else {
      langCode = ui.window.locale.languageCode;
    }
    if (!languages.contains(langCode)) {
      langCode = LANGUAGE_CODE_EN;
    }
  }

  updateLanguageLocal(String langcode) {
    langCode = langcode;
    if (!languages.contains(langCode)) {
      langCode = LANGUAGE_CODE_EN;
    }
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(Constants.SHARED_CURRENT_LANGUAGE, langcode);
    });
  }

  Map<String, Map<String, String>> multilan = {
    '${LANGUAGE_CODE_EN}': en,
    '${LANGUAGE_CODE_VI}': vi,
  };
}


class LanguageModel{

  String _id;
  String _name;


  LanguageModel(this._name, this._id);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

}

