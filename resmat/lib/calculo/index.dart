import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resmat/Home.dart';
import '../SharedSettings.dart';
import '../Language.dart';


import '../Configurations.dart';
import '../calculo/index.dart';
import '../Language.dart';
import '../SharedSettings.dart';



class CalculationIndex extends StatefulWidget{
  
  _CalculationIndexWidget createState() => _CalculationIndexWidget();
 // State<FutureBuilder<_ConfigButtonsWidget>> createState() => _ConfigButtonsWidget<T>();

}


class _CalculationIndexWidget extends State<CalculationIndex> {

  var pi = 3.1415;
  var diametroValue;
  var powerValue;
  var frequencyValue;
  var shearModulusValue;
  var beamLenghtValue;

  //Pela teoria da torsão
  var torque = 0.00;
   
  var polarMomentus = 0.00;

  var maxShearStress = 0.00;

  var anglePartOne = 0.00;

  var anglePartFinal = 0.00;

  Widget build(BuildContext context) {
     Future<String> verificaSetLinguagemDeUsuario() async{
    String aux = await SharedPreferenceSetting().getLanguage();
    if(aux == "en"){
      return "en";
    }
    else{
      return "pt"; 

    }
  }

  var btnVoltar =  FlatButton( 
       onPressed: ( ) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()),     ModalRoute.withName("/Home") ); },                                          
          child: Container(
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Row(
              children: <Widget>[
              SizedBox(
              child: Image.asset('images/arrow.png'),
              width: 20),
              Align(alignment:  Alignment.topLeft,child: Text("Voltar",textAlign: TextAlign.left, style: TextStyle(fontSize: 25, fontFamily: 'Myriad-Regular',  color: Color.fromRGBO(77, 76, 76, 1))))
              ],
          )
          )
      );

 var btn1 = Expanded(
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
                padding: const EdgeInsets.all(8.0),
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
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 100,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: FutureBuilder(
                            future: switchDeLinguagem,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return 
                                  Text(AppLocalizations.of(context).translate("calculationIndex", snapshot.data, "btn1"), textAlign: TextAlign.right,
                                  style: TextStyle(
                                  fontFamily: 'Myriad-Bold', fontSize: 24));
                              }else{
                                 return 
                                 Center(
                                    child: CircularProgressIndicator(),
                                  );
                              }
                            
                            
                            }),
                          
                         
                        )


                      ],
                    ),
                  ],
                )),
          )),
    );
 var btn2 = Expanded(
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
                padding: const EdgeInsets.all(8.0),
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
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 100,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: FutureBuilder(
                            future: switchDeLinguagem,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return 
                                  Text(AppLocalizations.of(context).translate("calculationIndex", snapshot.data, "btn2"), textAlign: TextAlign.right,
                                  style: TextStyle(
                                  fontFamily: 'Myriad-Bold', fontSize: 24));
                              }else{
                                 return 
                                 Center(
                                    child: CircularProgressIndicator(),
                                  );
                              }
                            
                            
                            }),
                          
                         
                        )


                      ],
                    ),
                  ],
                )),
          )),
    );

    var body = Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),

        child: Row(
          
          children: <Widget>[
            btn1
          ],
        ) 
      
    );
    
    return Scaffold(
      appBar: null,
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/back2.png"), fit: BoxFit.fill)),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child:btnVoltar ,
                ),
                Container(
                  child: Center(heightFactor: 1, child: body )
                  ),    
            ],
            
            ),
    
              
      )
    );
  
  
  void initState(){
    switchDeLinguagem = verificaSetLinguagemDeUsuario(); // a chamada de valor DEVE SER SEMPRE antes do initSate*** devido a arvore de construcao do widget
    super.initState();
     
     //Lock landscape mode :)
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
    ]);

  }
  



}

 


}
