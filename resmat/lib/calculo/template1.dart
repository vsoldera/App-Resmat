import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resmat/Configurations.dart';
import '../SharedSettings.dart';
import '../Language.dart';
import '../Configurations.dart';
import '../Home.dart';
import 'index.dart';
import 'ResultTemplate1.dart';


class Dados{
    double tamanhoBarra, moduloCisalhamento, raio;
    List<double> torques = List();
    List<double> posicaoX = List();


    double getTamanhoBarra(){
      return this.tamanhoBarra;
    }
    setTamanhoBarra(double i){
      this.tamanhoBarra=i;
    }
    double getModuloCisalhamento(){
      return this.moduloCisalhamento;
    }
    setModuloCisalhamento(double i){
      this.moduloCisalhamento=i;
    }
    double getRaio(){
      return this.raio;
    }
    setRaio(double i){
      this.raio=i;
    }
  
}


Future<String> switchDeLinguagem;

class Template1 extends StatefulWidget {
    
    _Template1Widget createState() => _Template1Widget();
}
  
  class _Template1Widget extends State<Template1> {
  
    TextEditingController emailController = new TextEditingController();

    Dados dados = new Dados();
      
    List<Widget> list = new List();

    int allHailIndex = 0;
  
  
    Future<String> verificaSetLinguagemDeUsuario() async{
      String aux = await SharedPreferenceSetting().getLanguage();
      if(aux == "en"){
        return "en";
      }
      else{
        return "pt"; 
  
      }
    }
    @override
    Widget build(BuildContext context) {
  
  
   
  
  
      var body = 
        FutureBuilder(
          future: switchDeLinguagem,
          builder: (context, snap){
            if(snap.hasData){
              return
               ListView(
                padding: EdgeInsets.all(20),
                children: <Widget>[
                  FlatButton(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                  onPressed: () {
                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CalculationIndex()),     ModalRoute.withName("/Calculation Index") ); 
                  },
                  child: Row(
                    children: <Widget>[
                      SizedBox(child: Image.asset('images/arrow-rosa.png'), width: 20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(" "+AppLocalizations.of(context).translate("template1", snap.data, "backButtonText"),
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
  
  
                  TextField(
                      keyboardType: TextInputType.number,
                     onChanged: (text){
                            dados.setTamanhoBarra(double.parse(text));
                     },
                     decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderSide: BorderSide(color: Color.fromRGBO(137, 137, 137, 1))
                      ),
                      hintText: AppLocalizations.of(context).translate("template1", snap.data, "btn1")
                      ),
                  ),
                SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.number,
                     onChanged: (text){
                            dados.setRaio(double.parse(text));
                     },
                     decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderSide: BorderSide(color: Color.fromRGBO(137, 137, 137, 1))
                      ),
                      hintText: AppLocalizations.of(context).translate("template1", snap.data, "btn2")
                      ),
                  ),
  
                SizedBox(height: 20),
  
                TextField(
                     keyboardType: TextInputType.number,
                     onChanged: (text){
                          dados.setModuloCisalhamento(double.parse(text));
                     },
                     decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderSide: BorderSide(color: Color.fromRGBO(137, 137, 137, 1))
                      ),
                      hintText:  AppLocalizations.of(context).translate("template1",snap.data, "btn3")
                      ),
                  ),
  
                SizedBox(height: 20),
  
                Text(
                  
                  "Aperte em '+ Torque' para adicionar uma torção", textAlign: TextAlign.center,
                  style:TextStyle(fontSize: 20, fontFamily: 'Myriad-Bold', color: Color.fromRGBO(255, 85, 113, 1)),
  
                ),
                 
                  /* Torque Dinamico  */
                Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 30),
                    child: new ListView.builder(
                    physics: ScrollPhysics(), //que FISICO! 
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];
                      Widget widget = list.elementAt(index);

                    

                      return 
                      Dismissible(
                            direction: DismissDirection.endToStart,
                            // Each Dismissible must contain a Key. Keys allow Flutter to
                            // uniquely identify widgets.
                            key: ValueKey(item),
                            // Provide a function that tells the app
                            // what to do after an item has been swiped away.
                            onDismissed: (direction) {
                              // Remove the item from the data source.
                              setState(() {
  
                                if (index % 2 == 0) { 
                                  list.removeAt(index+1);
                                  list.removeAt(index);
                                  }
                                else{
                                  list.removeAt(index);
                                  list.removeAt(index-1);
                                }
  
                                
                              });
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(AppLocalizations.of(context).translate("template1", snap.data, "deleteMsg"))));
                            },
                            
                            background: Container(alignment: Alignment.centerRight, padding: EdgeInsets.fromLTRB(0, 0, 10, 0),color: Colors.red, child: Icon(IconData(59694, fontFamily: 'MaterialIcons' ), color: Color.fromRGBO(255, 255, 255, 1))),
                            
                            child: widget,
                          );
                      
                    })
            ),
            
  
               SizedBox(height: 20),
  
                  
              FlatButton(
                color: Color.fromRGBO(255, 85, 113, 1),
                padding: EdgeInsets.all(20),
                onPressed: () {
                    for(int j=0; j<dados.torques.length; j++){
                            print("torques"+dados.torques[j].toString());
                          }
                          for(int j=0; j<dados.posicaoX.length; j++){
                            print("porisca x"+dados.posicaoX[j].toString());
                          }
                  
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => ResultTemplate1(dados1: dados), 
                     ),
                        ModalRoute.withName("/Result Template"));
                },
                child: SizedBox(
                  
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Text(
                    AppLocalizations.of(context).translate("template1", snap.data, "calculateButton"),textAlign: TextAlign.center,
                     style:TextStyle(fontSize: 20, fontFamily: 'Myriad-Bold', color: Color.fromRGBO(255, 255, 255, 1)
                  )
                  ),
                ) 
              )
  
            
            ],
          );
  
  
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        );
                
  
      
  
      var floatingButton = 
      
      FutureBuilder(
        future: switchDeLinguagem,
        builder: (context, snap){
  
            if(snap.hasData){
                return  
                FloatingActionButton.extended(
                onPressed: () {
                  var comboInput = list.add(
                    TextField(
                      key: UniqueKey(),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        
                          dados.torques.add(double.parse(text));
                        
                      },
                      decoration: InputDecoration(hintText: "Torque"),
                    ),
                  );
                  list.add(
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                          dados.posicaoX.add(double.parse(text));
                      },
                      decoration: InputDecoration(hintText: AppLocalizations.of(context).translate("template1", snap.data, "listTorque")),
                    ),
                  );
                  setState(() {});
                },
                icon: Icon(IconData(57669, fontFamily: 'MaterialIcons')),
                label: Text("Torque"),
              );
      
      
      
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
  
  
  
  
        }
  
      );
     
      return new Scaffold(
        appBar: null,
          body: Container(height: 1500, child:body),
          floatingActionButton: floatingButton,
  
    
      );
  
  
    }
  
      //Deixar esta merda
     void initState(){
      switchDeLinguagem = verificaSetLinguagemDeUsuario(); // a chamada de valor DEVE SER SEMPRE antes do initSate*** devido a arvore de construcao do widget
      super.initState();
    }
}