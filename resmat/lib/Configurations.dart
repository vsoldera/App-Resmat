import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resmat/Home.dart';
import 'SharedSettings.dart';
import 'Language.dart';

const Locale ptbr = Locale("pt", "BR");
const Locale english = Locale("en", "US");
Future<String> switchDeLinguagem;
Future<String> confBtnSetCor;
var colorImperialButton;
var colorInternationalButton;
var colorPtButton;
var colorEnButton;

class ConfigurationsPage extends StatefulWidget{
  
  _ConfigButtonsWidget createState() => _ConfigButtonsWidget();
 // State<FutureBuilder<_ConfigButtonsWidget>> createState() => _ConfigButtonsWidget<T>();

}




class _ConfigButtonsWidget extends State<ConfigurationsPage> {


   Future<String> verificaSetSistemaMedida() async{ //vai verificar no shared preferences o que o usuario havia selecionado, caso nao bata com nadoka seta international bb, pq esse é o role
    String aux = await SharedPreferenceSetting().getSystem();
    if(aux == "imperial"){
      colorInternationalButton = Color.fromRGBO(255, 86, 113, 1);
      colorImperialButton = Color.fromRGBO(143, 48, 58, 1);
      return "imperial";
    }
    else{
       colorImperialButton = Color.fromRGBO(255, 86, 113, 1);
       colorInternationalButton = Color.fromRGBO(143, 48, 58, 1);
      return "international"; 

    }
  }

  Future<String> verificaSetLinguagemDeUsuario() async{
    String aux = await SharedPreferenceSetting().getLanguage();
    if(aux == "en"){
      colorEnButton =  Color.fromRGBO(143, 48, 58, 1);
      colorPtButton =  Color.fromRGBO(255, 86, 113, 1);
      return "en";
    }
    else{
       colorEnButton =   Color.fromRGBO(255, 86, 113, 1);
      colorPtButton = Color.fromRGBO(143, 48, 58, 1);
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
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                child: Image.asset('images/arrow.png'),
                                                width: 20),
                                              Align(alignment:  Alignment.topLeft,child: Text(" "+AppLocalizations.of(context).translate("configurations", snapshot.data, "backButtonText"),textAlign: TextAlign.left, style: TextStyle(fontSize: 25, fontFamily: 'Myriad-Regular',  color: Color.fromRGBO(77, 76, 76, 1))))

                                            ],
                                          ) 
                                          
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
                                          color: colorEnButton,
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
                                          color: colorPtButton,
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

                                FutureBuilder(
                                  future: confBtnSetCor, // essa variavel vai definir qual sistema de media esta selecionado e mudar a cor dele de fundinho bjos
                                  builder: (context, result) {
                                    if (result.hasData) {

                                      return   
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
                                                    color: colorInternationalButton,
                                                    textColor: Colors.white,
                                                    onPressed: _toggleSystemInternational,
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
                                                    color:colorImperialButton,
                                                    textColor: Colors.white,
                                                    onPressed:  _toggleSystemImperial,
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
                                          );




                                      
                                    }else{
                                       return Center(
                                        child: CircularProgressIndicator(),
                                       );
                                    }

                                  }
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:
                                  Text(
                                  "Developing...",
                                   style: TextStyle(fontSize: 17,color: Color.fromRGBO(255, 85, 113, 1)),
                                )
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
    confBtnSetCor = verificaSetSistemaMedida(); //seta logo de inicio o que vc quer mano, nao perde tempo, future is logo la
    super.initState();

  }
void _toggleLanguageEN()  {
  setState(() {
    SharedPreferenceSetting().setLanguage("en");
    // var1 = AppLocalizations.of(context).translate("configurations", "en", "title");
    
    switchDeLinguagem =  verificaSetLinguagemDeUsuario();
    SharedPreferenceSetting().setSystem("imperial");
    confBtnSetCor =  verificaSetSistemaMedida();
    //print("Passei no en\n");
  });
}
void _toggleLanguagePT() {
  setState(() {
    SharedPreferenceSetting().setLanguage("pt");
    //  var1 =  AppLocalizations.of(context).translate("configurations", "pt", "title");
    switchDeLinguagem = verificaSetLinguagemDeUsuario();
    SharedPreferenceSetting().setSystem("international");  
    confBtnSetCor =  verificaSetSistemaMedida();
    //print("passei no pt\n");
  });
}

void _toggleSystemImperial()  {
  setState(() {
    SharedPreferenceSetting().setLanguage("en");
    // var1 = AppLocalizations.of(context).translate("configurations", "en", "title");
    
    switchDeLinguagem =  verificaSetLinguagemDeUsuario();
    SharedPreferenceSetting().setSystem("imperial");
    confBtnSetCor =  verificaSetSistemaMedida();
  });
}
void _toggleSystemInternational()  {
  setState(() {
    SharedPreferenceSetting().setLanguage("pt");
    //  var1 =  AppLocalizations.of(context).translate("configurations", "pt", "title");
    switchDeLinguagem = verificaSetLinguagemDeUsuario();
    SharedPreferenceSetting().setSystem("international");  
    confBtnSetCor =  verificaSetSistemaMedida();
  });
}

}
