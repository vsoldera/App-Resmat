import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Configurations.dart';
import 'Language.dart';
import 'SharedSettings.dart';
import 'Language.dart';

class Home extends StatefulWidget {

   _HomeWidget createState() => _HomeWidget();

 
}

class _HomeWidget extends State<Home> {
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
                          padding: const EdgeInsets.all(8.0),
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
                                        0, 135, 5, 10),
                                    width: MediaQuery.of(context).size.width * 0.35,
                                    child: Flexible(
                                      
                                   child: FutureBuilder(
                                      future: switchDeLinguagem,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return 
                                            Text(AppLocalizations.of(context).translate("home", snapshot.data, "button1"),                  overflow: TextOverflow.ellipsis,

                                            style: TextStyle(
                                            fontFamily: 'Myriad-Bold', fontSize: 24));
                                        }else{
                                          return 
                                          Center(
                                              child: CircularProgressIndicator(),
                                            );
                                        }
                                      
                                      
                                      })),

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
                padding: const EdgeInsets.all(8.0),
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
                          width: MediaQuery.of(context).size.width * 0.32,
                          padding: const EdgeInsets.fromLTRB(0, 135, 5, 10),
                          child:                          
                          FutureBuilder(
                            future: switchDeLinguagem,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return 
                                  Text(AppLocalizations.of(context).translate("home", snapshot.data, "button2"),
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
                          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                          child: FutureBuilder(
                            future: switchDeLinguagem,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return 
                                  Text(AppLocalizations.of(context).translate("home", snapshot.data, "button3"), textAlign: TextAlign.right,
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
 




 return Scaffold(
        appBar: null,
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/back1.jpg"), fit: BoxFit.fill)),
            child: Center(heightFactor: 5, child: body )));
 }

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
