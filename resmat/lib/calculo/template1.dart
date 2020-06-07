import 'package:flutter/material.dart';
import 'package:resmat/Configurations.dart';
import '../SharedSettings.dart';
import '../Language.dart';
import '../Configurations.dart';
import '../Home.dart';

  Future<String> switchDeLinguagem;

class Template1 extends StatefulWidget {
    _Template1Widget createState() => _Template1Widget();
}

class _Template1Widget extends State<Template1> {

  var barLength = [];
  List<Widget> list = new List();


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
    var btnVoltar =  
      FlatButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              ModalRoute.withName("/Home"));
        },
        child: Row(
          children: <Widget>[
            SizedBox(child: Image.asset('images/arrow.png'), width: 20),
            Align(
                alignment: Alignment.topLeft,
                child: Text("Voltar",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Myriad-Regular',
                        color: Color.fromRGBO(77, 76, 76, 1))))
          ],
        )
      );


    var containerListBuilder = 
            ListView(
              children: <Widget>[
                TextField(
                            onChanged: (text){
                          
                            },
                            decoration: InputDecoration(
                            border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromRGBO(137, 137, 137, 1))
                            ),
                            hintText: 'Enter a search term'
                          ),
                        ),
                       
              Container(
                  padding: EdgeInsets.all(20.0),
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
                                content: Text("Conjunto foi excluído com sucesso!")));
                          },
                          
                          background: Container(alignment: Alignment.centerRight, padding: EdgeInsets.fromLTRB(0, 0, 10, 0),color: Colors.red, child: Icon(IconData(59694, fontFamily: 'MaterialIcons' ), color: Color.fromRGBO(255, 255, 255, 1))),
                          
                          child: widget,
                        );
                    
                  })
          )
          ],);

    var body = 
      FutureBuilder(
        future: switchDeLinguagem,
        builder: (context, snap){
          if(snap.hasData){
            
            return containerListBuilder;

          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      );
              

    

    var floatingButton = new FloatingActionButton.extended(
          onPressed: () {
            var comboInput = list.add(
              TextField(
                onChanged: (text) {
                  barLength[list.length] = int.parse(text);
                  print(barLength);
                },
                decoration: InputDecoration(hintText: 'Torque: '),
              ),
            );
            list.add(
             
              TextField(
                onChanged: (text) {
                  barLength[list.length] = int.parse(text);
                  print(barLength);
                },
                decoration: InputDecoration(hintText: 'Posição "X": '),
              ),
            );
            list.add(
             
              
              SizedBox(height: 80,),
            );
            setState(() {});
          },
          icon: Icon(IconData(57669, fontFamily: 'MaterialIcons')),
          label: Text("Torque"),
        );
    
    
    
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ), 
         title: Text("Sample"),
        centerTitle: true,
      ),
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