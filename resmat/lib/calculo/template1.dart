import 'package:flutter/material.dart';

import '../Home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VariousTorques(),
    );
  }
}

class VariousTorques extends StatefulWidget {
  @override
  _VariousTorquesState createState() => _VariousTorquesState();
}

class _VariousTorquesState extends State<VariousTorques> {
  var barLength = [];

  List<Widget> list = new List();

  @override
  Widget build(BuildContext context) {
    var btnVoltar = FlatButton(
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
        ));




    return new Scaffold(
        body: new Container(
            padding: EdgeInsets.all(20.0),
            child: new ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];
                  Widget widget = list.elementAt(index);

                  return Dismissible(
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

                    background: Container(color: Colors.red),
                    child: widget,
                  );
                })),
        floatingActionButton: new FloatingActionButton.extended(
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
            setState(() {});
          },
          icon: Icon(IconData(57669, fontFamily: 'MaterialIcons')),
          label: Text("Torque"),
        ));








    //Deixar esta merda
    void initState() {
      super.initState();
    }
  }
}
