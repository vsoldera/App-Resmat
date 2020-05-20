import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Configurations.dart';
import 'Language.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/back1.jpg"), fit: BoxFit.fill)),
            child: Center(heightFactor: 5, child: MenuButtons())));
  }
}

class MenuButtons extends StatelessWidget {
  Widget build(BuildContext context) {
    var btnCalculo = Expanded(


  

                child: Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 10  horizontally
                            8.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: RaisedButton(
                      onPressed: () {},
                      textColor: Color(0xFFFF5671),
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFF),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                      child: Image.asset('images/xicon.png'),
                                      width: 25)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 135, 5, 10),
                                    child: const Text('CÁLCULO',
                                        style: TextStyle(
                                            fontFamily: 'Myriad-Bold',
                                            fontSize: 26)),
                                  )
                                ],
                              ),
                            ],
                          )),
                    )
                    )
              

        );
        


    var btnAjustes = Expanded(
      child: Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 0.0, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 10  horizontally
                  8.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: RaisedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ConfigurationsPage()),
                  ModalRoute.withName("/Home"));
            },
            textColor: Color(0xFFFF5671),
            padding: const EdgeInsets.all(0.0),
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFF),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                            child: Image.asset('images/ajustes.png'),
                            width: 30),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.fromLTRB(20, 135, 5, 10),
                          child: const Text('AJUSTES',
                              style: TextStyle(
                                  fontFamily: 'Myriad-Bold', fontSize: 26)),
                        )
                      ],
                    ),
                  ],
                )),
          )),
    );

    var btnCreditos = Expanded(
      child: Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 0.0, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 10  horizontally
                  8.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: RaisedButton(
            onPressed: () {},
            textColor: Color(0xFFFF5671),
            padding: const EdgeInsets.all(0.0),
            child: Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFF),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                            child: Image.asset('images/creditosicon.png'),
                            width: 50)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.fromLTRB(180, 75, 5, 10),
                          child: Text('CRÉDITOS',
                              style: TextStyle(
                                  fontFamily: 'Myriad-Bold', fontSize: 26)),
                        )
                      ],
                    ),
                  ],
                )),
          )),
    );

    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              btnCalculo,
              SizedBox(height: 200, width: 10),
              btnAjustes,
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              btnCreditos,
            ],
          )
        ],
      ),
    );
  }
}
