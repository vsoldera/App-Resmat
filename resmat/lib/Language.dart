import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, dynamic> _localizedStringsEn;
  Map<String, dynamic> _localizedStringsPt;

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString('lang/' + "en" + '.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStringsEn = jsonMap.map((key, value) {
      // print("pt local\n"+ value.toString());
      return MapEntry(key, value);
    });

    String jsonString2 = await rootBundle.loadString('lang/' + "pt" + '.json');

    Map<String, dynamic> jsonMap2 = json.decode(jsonString2);

    _localizedStringsPt = jsonMap2.map((key, value) {
      //  print("pt local\n"+ value.toString());
      return MapEntry(key, value);
    });
  }

  /*
      String jsonString = await rootBundle.loadString('lang/' + "pt" + '.json');

      print("String: $jsonString\n");
      Map<String, dynamic> jsonMap = json.decode(jsonString);

      _localizedStrings = jsonMap.map((key, value) {
        return MapEntry(key, value.toString());
      });
      return true
    }
    */

  String translate(String key, String language, String key2) {
    this.load();
    if (language == "en") {
      return _localizedStringsEn[key][key2].toString();
    } else
      return _localizedStringsPt[key][key2].toString();
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations();
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => true;

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return true;
    // UnimplementedError();
  }
}