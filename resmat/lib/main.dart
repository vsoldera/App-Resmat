import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Home.dart';
import 'Language.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Myriad-Regular'),
      home: MyLanguage(), //run the home page of the application
    ),
  );
}

class MyLanguage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      home: Home(),
    );
  }
}