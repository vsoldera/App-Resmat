import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resmat/SharedSettings.dart';

import 'main.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String> _localizedStringsEn;
  Map<String, String> _localizedStringsPt;


  Future<bool> load() async {

      String aaa = await SharedPreferenceSetting().getLanguage();
  
     
      String jsonString = await rootBundle.loadString('lang/' + "en" + '.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
    
      _localizedStringsEn = jsonMap.map((key, value) {
        print("en local\n"+ value.toString());
        return MapEntry(key, value.toString());
      }
      );

      String jsonString2 = await rootBundle.loadString('lang/' + "pt" + '.json');

      Map<String, dynamic> jsonMap2 = json.decode(jsonString2);
      
      _localizedStringsPt = jsonMap2.map((key, value) {
          print("pt local\n"+ value.toString());
          return MapEntry(key, value.toString());
      });

    }
  
    /*
      String jsonString = await rootBundle.loadString('lang/' + "pt" + '.json');

      print("String: $jsonString\n");
      Map<String, dynamic> jsonMap = json.decode(jsonString);

      _localizedStrings = jsonMap.map((key, value) {
        return MapEntry(key, value.toString());
      });
      return true;
    }
    */

  String translate(String key, int i)  {
     this.load();
    if( i == 1){
      return _localizedStringsEn[key];
    }else return _localizedStringsPt[key];

    
  }
  
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'pt'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => true;

  
}
