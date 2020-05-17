import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SharedSettings.dart';
import 'FancyFAB.dart';
import 'Language.dart';

const Locale ptbr = Locale("pt", "BR");
const Locale english = Locale("en", "US");
var ln;
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
  
}

void confre() async{
    String aux = await SharedPreferenceSetting().getLanguage();
    if(aux == "en")  ln = "en";
    else  ln = "pt"; 
  }



class _ConfigButtonsWidget extends State<ConfigButtons> {
  var var1 = "temp";

  
  
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 3,
      child: Container(
        child: Column(
          children: [
            //Widget
            Text(AppLocalizations.of(context).translate("configurations", ln, "title"), style: TextStyle(fontSize: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                ButtonTheme(
                  minWidth: 150,
                  child: RaisedButton(
                      onPressed:   _toggleLanguageEN,
                      child: Text(AppLocalizations.of(context).translate("configurations", ln, "buttonEnglish"), style: TextStyle(fontSize: 20))),
                ),
                const SizedBox(),
                ButtonTheme(
                  minWidth: 150,
                  child: RaisedButton(
                    onPressed: _toggleLanguagePT,
                    child: Text(AppLocalizations.of(context).translate("configurations", ln, "buttonPortuguese"), style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
            Text('Configuraçoes de medida: ', style: TextStyle(fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                ButtonTheme(
                  minWidth: 150,
                  child: RaisedButton  ( 
                    onPressed: () {},
                    child: Text('Sistema Internacional',
                        style: TextStyle(fontSize: 10)),
                  ),
                ),
                const SizedBox(),
                ButtonTheme(
                  minWidth: 150,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('Sistema Imperial',
                        style: TextStyle(fontSize: 10)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  

 void initState(){
    super.initState();
    confre();
    print("Passei no init\n" + var1);

  }
void _toggleLanguageEN()  {
  setState(() {
    SharedPreferenceSetting().setLanguage("en");
    // var1 = AppLocalizations.of(context).translate("configurations", "en", "title");
    ln = "en";
     //print("Passei no en\n");
  });
}
void _toggleLanguagePT() {
  setState(() {
    //SharedPreferenceSetting().setLanguage("pt");
    //  var1 =  AppLocalizations.of(context).translate("configurations", "pt", "title");
      //   print("passei no pt\n");
    ln = "pt";
  });
}

}
