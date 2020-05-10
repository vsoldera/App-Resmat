import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Calculation.dart';
import 'Credits.dart';
import 'Configurations.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[700],
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Text('Torção de Vigas'),
      ),
      body: MenuButtons(),
    );
  }
}

class MenuButtons extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 3,child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 30),
          ButtonTheme(
            buttonColor: Colors.black,
            minWidth: 200,
            child: RaisedButton(
                onPressed: () {
                  //Enviar
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalculationPage()),
                      ModalRoute.withName("/Home"));
                },
                child: Text('Cálculo',
                    style: TextStyle(fontSize: 20, color: Colors.white))),
          ),
          SizedBox(height: 30),
          ButtonTheme(
              buttonColor: Colors.black,
              minWidth: 200,
              child: RaisedButton(
                onPressed: () {
                  //Enviar
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfigurationsPage()),
                      ModalRoute.withName("/Home"));
                },
                child: Text('Configurações',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              )
              ),
          SizedBox(height: 30),
          ButtonTheme(
              buttonColor: Colors.black,
              minWidth: 200,
              child: RaisedButton(
                onPressed: () {
                  //Enviar
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => CreditsPage()),
                      ModalRoute.withName("/Home"));
                },
                child: Text('Créditos',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              )
              ),
        ],
      ),
    );
  }
}
