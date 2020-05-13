import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:resmat/SharedSettings.dart';
import 'Home.dart';
import 'Language.dart';
import 'dart:io';
import 'dart:async';

void main()  {
  runApp(
    MaterialApp(
      home: MyLanguage(), //run the home page of the application
    ),
  );
}

class MyLanguage extends StatelessWidget {
  Widget build(BuildContext context) {
    
    return MaterialApp(
      supportedLocales: [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: Home(),
    );
  }
}
