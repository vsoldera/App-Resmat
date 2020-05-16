import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FancyFAB.dart';
import 'Language.dart';

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
             AppLocalizations.of(context).translate("second_string", 1),
            ),
        ),
        body: Photos(),
        floatingActionButton: FancyFab());
  }
}

class Photos extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 3,
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Gabriel Gonçalves' + '\n' + 'Mattos Santini',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(flex: 2, child: Image.asset("images/x.png")),
                Expanded(
                  child: Text(
                    'Luiz Vinicius' + '\n' + 'dos Santos Ruoso',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(flex: 2, child: Image.asset("images/x.png")),
                Expanded(
                  child: Text(
                    'Marcelo Germani' + '\n' + 'Olmos',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(flex: 2, child: Image.asset("images/x.png")),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Victor Felipe' + '\n' + 'dos Santos',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(flex: 2, child: Image.asset("images/x.png")),
                Expanded(
                  child: Text('Victor Luiz' + '\n' 'Fraga Soldera',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center),
                ),
                Expanded(flex: 2, child: Image.asset("images/x.png")),
                Expanded(
                  child: Text('Prof Dr. Fabio ' + '\n' 'Menegatti de Melo',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center),
                ),
                Expanded(flex: 2, child: Image.asset("images/x.png")),
              ],
            ),
          )
        ],
      )),
    );
  }
}
