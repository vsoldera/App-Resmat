import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resmat/Home.dart';
import '../SharedSettings.dart';
import '../Language.dart';
import '../Configurations.dart';
import 'template1.dart';


class CalculationIndex extends StatefulWidget{
  
  _CalculationIndexWidget createState() => _CalculationIndexWidget();
 // State<FutureBuilder<_ConfigButtonsWidget>> createState() => _ConfigButtonsWidget<T>();

}


class _CalculationIndexWidget extends State<CalculationIndex> {



  Future<String> verificaSetLinguagemDeUsuario() async{
    String aux = await SharedPreferenceSetting().getLanguage();
    if(aux == "en"){
      return "en";
    }
    else{
      return "pt"; 

    }
  }

  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: null,
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/back2.png"), fit: BoxFit.fill)),
            child: 
            
            FutureBuilder(
               future: switchDeLinguagem,
                    builder: (context, snapshot) {
                    if (snapshot.hasData) {
                        return  Column(
                          children: <Widget>[
                            //linhas de linhas
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.38,
                                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                                  child:
                                    FlatButton( 
                                    onPressed: ( ) {
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()),     ModalRoute.withName("/Home") ); },                                          
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                                          decoration: new BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Color.fromRGBO(255, 255, 255, 1),
                                              boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 5.0, // soften the shadow
                                                    spreadRadius: 0.0, //extend the shadow
                                                    offset: Offset(
                                                      0.0, // Move to right 10  horizontally
                                                      2.0, // Move to bottom 10 Vertically
                                                    ),
                                                  )
                                              ]
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                            SizedBox(
                                            child: Image.asset('images/arrow.png'),
                                            width: 20),
                                            Align(
                                              child: 
                                              Text(" "+ AppLocalizations.of(context).translate("calculationIndex", snapshot.data, "backButtonText"), textAlign: TextAlign.right,
                                              style: TextStyle(
                                              fontFamily: 'Myriad-Pro', fontSize: 24)),  
                                            )
                                          ]
                                        )
                                    )
                                ),
                                ),
                              ),
                            
                              ListView(
                                padding: EdgeInsets.only(top: 15, bottom: 15, left: 0, right: 0),
                                scrollDirection: Axis.vertical,
                                reverse: false,
                                shrinkWrap: true,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      
                                    ),
                                  child: RaisedButton(
                                    onPressed: () {  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyApp()),     ModalRoute.withName("/Home") );
                                    },                                          
                                    textColor: Color(0xFFFF5671),
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                        height: 140,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(255, 255, 255, 0.8),
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
                                                  
                                                        child:  Text(AppLocalizations.of(context).translate("calculationIndex", snapshot.data, "btn1"), textAlign: TextAlign.right,
                                                          style: TextStyle(
                                                          fontFamily: 'Myriad-Bold', fontSize: 24)),
                                                    
                                                    
                                                    
                                                  
                                                
                                                        )


                                                      ],

                                            ),
                                          ],
                                        )
                                        ),
                                  )
                                ),  


                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                     
                                    ),
                                  child: RaisedButton(
                                    onPressed: () {},
                                    textColor: Color(0xFFFF5671),
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                        height: 140,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(255, 255, 255, 0.8),
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
                                                  
                                                        child:  Text(AppLocalizations.of(context).translate("calculationIndex", snapshot.data, "btn1"), textAlign: TextAlign.right,
                                                          style: TextStyle(
                                                          fontFamily: 'Myriad-Bold', fontSize: 24)),
                                                    
                                                    
                                                    
                                                  
                                                
                                                        )


                                                      ],

                                            ),
                                          ],
                                        )
                                        ),
                                  )
                                ),



                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  child: RaisedButton(
                                    onPressed: () {},
                                    textColor: Color(0xFFFF5671),
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                        height: 140,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(255, 255, 255, 0.8),
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
                                                  
                                                        child:  Text(AppLocalizations.of(context).translate("calculationIndex", snapshot.data, "btn1"), textAlign: TextAlign.right,
                                                          style: TextStyle(
                                                          fontFamily: 'Myriad-Bold', fontSize: 24)),
                                                    
                                                    
                                                    
                                                  
                                                
                                                        )


                                                      ],

                                            ),
                                          ],
                                        )
                                        ),
                                  )
                                ),
                              
                                ],
                          
                          
                          
                              )
            
                          ]
                        );
                    }else{
                      return  Center(
                          child: CircularProgressIndicator(),
                          );

                    }
                  }


            ),
            
      )
    );
  
  
  
  



}

 void initState(){
    switchDeLinguagem = verificaSetLinguagemDeUsuario(); // a chamada de valor DEVE SER SEMPRE antes do initSate*** devido a arvore de construcao do widget
    super.initState();
     
 

  }


}
