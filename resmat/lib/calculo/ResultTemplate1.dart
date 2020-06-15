import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resmat/Configurations.dart';
import '../SharedSettings.dart';
import '../Language.dart';
import '../Configurations.dart';
import '../Home.dart';
import 'index.dart';
import 'template1.dart';



 class ResultTemplate1 extends StatefulWidget {
  Dados dados1 =new Dados();
  ResultTemplate1({Key key, @required this.dados1}) : super(key: key);
  
   _ResultTemplate1Widget createState() => _ResultTemplate1Widget(dados2: dados1);
}

class _ResultTemplate1Widget extends State<ResultTemplate1> {
       Dados dados2 =new Dados();

  _ResultTemplate1Widget({Key key, @required this.dados2});

    

  
  Widget build(BuildContext context) {
    print("raio:"+dados2.getRaio().toString());
    print("tamanho barra:"+dados2.getTamanhoBarra().toString());
    print("Modulo de Cisalhamento:"+dados2.getModuloCisalhamento().toString());
    int i;
    for(i=0; i< 1; i++){
      print("torque"+dados2.torques.toString());
      print("posicao X"+ dados2.posicaoX[i].toString());
    }


    // TODO: implement build
     return new Scaffold(
      appBar: null,
        body: Container(padding: EdgeInsets.fromLTRB(0, 150, 0, 0),height: 1500, 
        child:  FlatButton(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                onPressed: () {
                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CalculationIndex()),     ModalRoute.withName("/Calculation Index") ); 
                },
                child: Row(
                  children: <Widget>[
                    SizedBox(child: Image.asset('images/arrow-rosa.png'), width: 20),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(" "+AppLocalizations.of(context).translate("template1", 'en', "backButtonText"),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Myriad-Regular',
                                color: Color.fromRGBO(255, 85, 113, 1)
                                )
                              )
                            )
                  ],
                )
              ),
        )

        
        
        );
  }


}

