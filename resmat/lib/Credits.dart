import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Configurations.dart'; //esse input tras o switch de lingugens e as funcoes de alteracao
import 'SharedSettings.dart';
import 'Language.dart';
import 'Home.dart';

Future<String> switchDeLinguagem;

class CreditsPage extends StatefulWidget {
   _ContentCredits  createState() => _ContentCredits();
}

class _ContentCredits extends State<CreditsPage> {
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

  var estiloTextoSecundario=
  TextStyle( fontFamily: 'Myriad-Bold', fontSize: 30,color: Color.fromRGBO(255, 86, 113, 1),
      
  );
  var estiloCorpoTexto = 
  TextStyle( fontFamily: 'Myriad-Pro', fontSize: 20,color: Color.fromRGBO(73, 73, 73, 1),
       
  );
  var titulo = 
    FutureBuilder(
      future: switchDeLinguagem ,
      builder: (context, snapshot) {
        
        if(snapshot.hasData){
          return
            Align(
              alignment: Alignment.topCenter,
              child:Text(AppLocalizations.of(context).translate("credits", snapshot.data, "title"), 
                  style: TextStyle( fontFamily: 'Myriad-Bold', fontSize: 55,color:Color.fromRGBO(226, 77,  99, 1),
                        
                      )
                  )
            );

        }else{
          return 
          Center(
              child: CircularProgressIndicator(),
          );
        }
      },            
    ) ;

 var titulo2 =  FutureBuilder(
      future: switchDeLinguagem ,
      builder: (context, snapshot) {
        
        if(snapshot.hasData){
          return
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: 
            Align(
              alignment: Alignment.topCenter,
              child:Text(AppLocalizations.of(context).translate("credits", snapshot.data, "title2"), 
                  style: estiloTextoSecundario,
                  )
            ),
          
          );

        }else{
          return 
          Center(
              child: CircularProgressIndicator(),
          );
        }
      },            
    ) ;
var titulo3 =  FutureBuilder(
      future: switchDeLinguagem ,
      builder: (context, snapshot) {
        
        if(snapshot.hasData){
          return
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: 
            Align(
              alignment: Alignment.topCenter,
              child:Text(AppLocalizations.of(context).translate("credits", snapshot.data, "title3"), 
                  style: estiloTextoSecundario,
                  )
            ),
          
          );

        }else{
          return 
          Center(
              child: CircularProgressIndicator(),
          );
        }
      },            
    ) ;

var btnVoltar =
  FutureBuilder(
      future: switchDeLinguagem ,
      builder: (context, snapshot) {
        
        if(snapshot.hasData){
          return
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: 
            Align(
              alignment: Alignment.topCenter,
              child:FlatButton( 
                onPressed: ( ) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()),     ModalRoute.withName("/Home") ); },
                child: Row(
                children: <Widget>[
                SizedBox(
                child: Image.asset('images/arrow.png'),
                width: 20),
                Align(alignment:  Alignment.topLeft,child: Text(" "+AppLocalizations.of(context).translate("credits", snapshot.data, "button1"),textAlign: TextAlign.left, style: TextStyle(fontSize: 25, fontFamily: 'Myriad-Regular',  color: Color.fromRGBO(77, 76, 76, 1))))
                ],
                ) 
                )
            ),
          
          );

        }else{
          return 
          Center(
              child: CircularProgressIndicator(),
          );
        }
      },            
    ) ;


  var desenvolvedores =
          Container(
            padding: EdgeInsets.fromLTRB(5, 10, 0, 0) ,
            child: RichText(
                  text: TextSpan(
                    text: 'Gabriel Santini \nLuiz V. Ruoso \nMarcelo Olmos \nVictor F. Santos \nVictor L. Soldera',
                    style: estiloCorpoTexto,
                  ),
              ) ,
          );
                   

  var professores =
          Container(
            padding: EdgeInsets.fromLTRB(5, 10, 0, 0) ,
            child: RichText(
                  text: TextSpan(
                    text: 'Prof.: Fábio',
                    style: estiloCorpoTexto,
                  ),
              ) ,
          );
  var versao = 
    
          Container(
            padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: 
            Align(
              alignment: Alignment.bottomRight,
              child:Text("v 1.0.0 - 2020", 
                    style: TextStyle(fontFamily: 'Myriad-Pro', fontSize: 20,color: Color.fromRGBO(30, 30, 30, 1)),
                  
                  )
            ),
        
          );

   
   var body = Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
             btnVoltar,
            ],
          ),
          Row(
            children: <Widget>[
             titulo,
            ],
          ),
          Row(
            children: <Widget>[
              titulo2,
            ],
          ),
          Row(
            children: <Widget>[
              desenvolvedores,
            ],
          ),
          Row(
            children: <Widget>[
              titulo3,
            ],
          ),
          Row(
            children: <Widget>[
              professores,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              versao,
            ],
          ),

        ],
      );

    return Scaffold(
        appBar: null,
        body: Container(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: body )
        );

  }

   void initState(){
    switchDeLinguagem =  verificaSetLinguagemDeUsuario(); // a chamada de valor DEVE SER SEMPRE antes do initSate*** devido a arvore de construcao do widget
    super.initState();

  }
}
