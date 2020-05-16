import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SharedSettings.dart';
import 'FancyFAB.dart';
import 'Language.dart';

const Locale ptbr = Locale("pt", "BR");
const Locale english = Locale("en", "US");

class ConfigurationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
        ),
        body: ConfigButtons(),
        floatingActionButton: FancyFab());
  }
}

class ConfigButtons extends StatefulWidget{
  
  _ConfigButtonsWidget createState() => _ConfigButtonsWidget();
  
}

class _ConfigButtonsWidget extends State<ConfigButtons> {
  var var1 = "temp";
  var v2;
  
  void confre() async{
        String l = await SharedPreferenceSetting().getLanguage();
        if(l == "en")  _toggleLanguageEN();
        else  _toggleLanguagePT(); 
        print("Passei no confre\n"+l);
  }
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 3,
      child: Container(
        child: Column(
          children: [
            //Widget
            
            Text(var1, style: TextStyle(fontSize: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                ButtonTheme(
                  minWidth: 150,
                  child: RaisedButton(
                      onPressed:   _toggleLanguageEN,
                      child: Text('Inglês', style: TextStyle(fontSize: 20))),
                ),
                const SizedBox(),
                ButtonTheme(
                  minWidth: 150,
                  child: RaisedButton(
                    onPressed: _toggleLanguagePT,
                    child: Text('Português', style: TextStyle(fontSize: 20)),
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
                  child: RaisedButton( 
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
    print("Passei no init\n");

  }
void _toggleLanguageEN()  {
  setState(() {
    SharedPreferenceSetting().setLanguage("en");
    var1 =  AppLocalizations.of(context).translate("second_string", 1);
     print("Passei no en\n");
  });
}
void _toggleLanguagePT() {
  setState(() {
    SharedPreferenceSetting().setLanguage("pt");
      var1 =  AppLocalizations.of(context).translate("first_string", 2);
         print("passei no pt\n");

  });
}
}
