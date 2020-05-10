import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FancyFAB.dart';

class CalculationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Cálculo"),
        ),
        floatingActionButton: FancyFab());

  }
}
