import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SharedSettings.dart';
import 'FancyFAB.dart';
import 'Language.dart';

const Locale ptbr = Locale("pt", "BR");
const Locale english = Locale("en", "US");
Future<String> switchDeLinguagem;
class ConfigurationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Configurações"),
          
        ),
        body: ConfigButtons(),
        floatingActionButton: FancyFab());
  }
}

class ConfigButtons extends StatefulWidget{
  
  _ConfigButtonsWidget createState() => _ConfigButtonsWidget();
 // State<FutureBuilder<_ConfigButtonsWidget>> createState() => _ConfigButtonsWidget<T>();

}




class _ConfigButtonsWidget extends State<ConfigButtons> {


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
    var titlePagina = "Settings";
    var appBar = AppBar(
                title: Text(titlePagina),
              );
    var body = Center(//BODY DO APP
      heightFactor: 3,
      child: FutureBuilder(
          future: switchDeLinguagem,
          builder:(context, snapshot) {
            if (snapshot.hasData) {
             
              print("Snapshot: "+ snapshot.data);
              print("LN - Snapshot: "+ snapshot.data);
                  return Container(
                            child: Column(
                              children: [
                                //Widget
                                Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "title"), style: TextStyle(fontSize: 40)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(),
                                    ButtonTheme(
                                      minWidth: 150,
                                      child: RaisedButton(
                                          onPressed:   _toggleLanguageEN,
                                          child: Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "buttonEnglish"), style: TextStyle(fontSize: 20))),
                                    ),
                                    const SizedBox(),
                                    ButtonTheme(
                                      minWidth: 150,
                                      child: RaisedButton(
                                        onPressed: _toggleLanguagePT,
                                        child: Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "buttonPortuguese"), style: TextStyle(fontSize: 20)),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "secondTitle"), style: TextStyle(fontSize: 30)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(),
                                    ButtonTheme(
                                      minWidth: 150,
                                      child: RaisedButton  ( 
                                        onPressed: () {},
                                        child: Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "buttonSetMedida1"),
                                            style: TextStyle(fontSize: 10)),
                                      ),
                                    ),
                                    const SizedBox(),
                                    ButtonTheme(
                                      minWidth: 150,
                                      child: RaisedButton(
                                        onPressed: () {},
                                        child: Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "buttonSetMedida2"),
                                            style: TextStyle(fontSize: 10)),
                                      ),
                                    ),
                                  ],
                                ),
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
      appBar: AppBar(
                title: Container(
                  child: FutureBuilder(
                          future: switchDeLinguagem, // a mesma logica utilizada para o body, vale pra ca. SwitchLg, continua sendo nossa chave para o "futuro"
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                             return Text(AppLocalizations.of(context).translate("configurations", snapshot.data, "headerTitle"));
                            }else{
                             return Text("Configurações");
                            }
                            },
                        ),
                      ),
          ),
          body: body,
          floatingActionButton: FancyFab()
      
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
