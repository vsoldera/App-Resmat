import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resmat/Home.dart';
import 'SharedSettings.dart';
import 'Language.dart';

const Locale ptbr = Locale("pt", "BR");
const Locale english = Locale("en", "US");
Future<String> switchDeLinguagem;


class ConfigurationsPage extends StatefulWidget{
  
  _ConfigButtonsWidget createState() => _ConfigButtonsWidget();
 // State<FutureBuilder<_ConfigButtonsWidget>> createState() => _ConfigButtonsWidget<T>();

}




class _ConfigButtonsWidget extends State<ConfigurationsPage> {


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
    
    var body = Center(//BODY DO APP
      heightFactor: 3,
      child: FutureBuilder(
          future: switchDeLinguagem,
          builder:(context, snapshot) {
            if (snapshot.hasData) {
             
              //print("Snapshot: "+ snapshot.data);
             // print("LN - Snapshot: "+ snapshot.data);
                  return Container(
                            margin: EdgeInsets.fromLTRB(20, 50, 20, 20), // margem do corpo inteiro
                            child: Column(
                              children: [
                                //Widget
                                Container(
                                  child:Row(
                                    children: <Widget>[

                                        //Botao voltar
                                        FlatButton( 
                                          onPressed: ( ) {
                                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()),     ModalRoute.withName("/Home") ); },
                                          child: Align(alignment: Alignment.topLeft,child: Text("< "+AppLocalizations.of(context).translate("configurations", snapshot.data, "backButtonText"),textAlign: TextAlign.left, style: TextStyle(fontSize: 25, fontFamily: 'Myriad-Regular',  color: Color.fromRGBO(77, 76, 76, 1))))
                                          )
                        
                                      
                                    ],
                                  )
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                                  child:Row(
                                    children: <Widget>[
                                      Container(
                                        child: Align(alignment: Alignment.centerLeft,child: Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "headerTitle"),textAlign: TextAlign.left, style: TextStyle(fontSize: 45, fontFamily: 'Myriad-Bold',  color: Color.fromRGBO(255, 86, 113, 1))))
                                      ),

                                    ],
                                  )
                                ),
                                Align(alignment: Alignment.topLeft,child: Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "title"),textAlign: TextAlign.left, style: TextStyle(fontSize: 30, fontFamily: 'Myriad-Bold',  color: Color.fromRGBO(77, 76, 76, 1)))),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(),
                                     Expanded(
                                      child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                      child: FlatButton(
                                         shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: BorderSide(color: Colors.red)),
                                          color: Color.fromRGBO(255, 86, 113, 1),
                                          textColor: Colors.white,
                                          onPressed:   _toggleLanguageEN,
                                          child:  
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              SizedBox(child: Image.asset('images/inglaterraicon.png'), width:30 ),
                                              Container(
                                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0), // margin interna img e texto
                                              height: 60,
                                              child: Align(alignment: AlignmentDirectional.centerEnd ,child:Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "buttonEnglish"), style: TextStyle(fontSize: 18)))
                                              ),
                                            

                                            ],
                                          )  
                                      ),
                                    ),
                                  ),
                                   
                                    const SizedBox(),
                                   
                                    Expanded(
                                      child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                      child: FlatButton(
                                         shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: BorderSide(color: Colors.red)),
                                          color: Color.fromRGBO(255, 86, 113, 1),
                                          textColor: Colors.white,
                                          onPressed:   _toggleLanguagePT,
                                          child:  
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                            SizedBox(child: Image.asset('images/bricon.png'), width:30 ),
                                            Container(
                                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0), // margin interna img e texto
                                            height: 60,
                                            child: Align(alignment: AlignmentDirectional.center,child:Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "buttonPortuguese"), style: TextStyle(fontSize: 18)))
                                            ),

                                          ],)
                                          
                                      ),
                                    ),
                                    
                                    ),
                                ], 
                              ),
                            ),
                                Align(alignment: Alignment.topLeft,child: Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "secondTitle"),textAlign: TextAlign.left, style: TextStyle(fontSize: 30, fontFamily: 'Myriad-Bold', color: Color.fromRGBO(77, 76, 76, 1)))),
                                Container(
                                  child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(),
                                    Expanded(
                                      child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                      child: FlatButton(
                                         shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: BorderSide(color: Colors.red)),
                                          color: Color.fromRGBO(255, 86, 113, 1),
                                          textColor: Colors.white,
                                          onPressed:  (){},
                                          child:  
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Container(
                                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0), // margin interna img e texto
                                              height: 60,
                                              child: Align(alignment: AlignmentDirectional.centerEnd ,child:Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "buttonSetMedida1"), style: TextStyle(fontSize: 18)))
                                              ),
                                            

                                            ],
                                          )  
                                      ),
                                    ),
                                  ),
                                    const SizedBox(),
                                    Expanded(
                                      child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                      child: FlatButton(
                                         shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: BorderSide(color: Colors.red)),
                                          color: Color.fromRGBO(255, 86, 113, 1),
                                          textColor: Colors.white,
                                          onPressed:  (){},
                                          child:  
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Container(
                                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0), // margin interna img e texto
                                              height: 60,
                                              child: Align(alignment: AlignmentDirectional.centerEnd ,child:Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "buttonSetMedida2"), style: TextStyle(fontSize: 18)))
                                              ),
                                            ],
                                          )  
                                      ),
                                    ),
                                  ),


                                  ],
                                ),
                                  )
                              ],
                            ),
                          );
            }//endif
            else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );

            }//endelse
          }
      )
    );



    return Scaffold(
      appBar: null,
          body: body,  
      );
  }
  

 void initState(){
    switchDeLinguagem =  verificaSetLinguagemDeUsuario(); // a chamada de valor DEVE SER SEMPRE antes do initSate*** devido a arvore de construcao do widget
    super.initState();

  }
void _toggleLanguageEN()  {
  setState(() {
    SharedPreferenceSetting().setLanguage("en");
    // var1 = AppLocalizations.of(context).translate("configurations", "en", "title");
    
    switchDeLinguagem =  verificaSetLinguagemDeUsuario();
    //print("Passei no en\n");
  });
}
void _toggleLanguagePT() {
  setState(() {
    SharedPreferenceSetting().setLanguage("pt");
    //  var1 =  AppLocalizations.of(context).translate("configurations", "pt", "title");
    switchDeLinguagem = verificaSetLinguagemDeUsuario();
    //print("passei no pt\n");
  });
}

}
