import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resmat/Home.dart';
import '../SharedSettings.dart';
import '../Language.dart';



class CalculationIndex extends StatefulWidget{
  
  _CalculationIndexWidget createState() => _CalculationIndexWidget();
 // State<FutureBuilder<_ConfigButtonsWidget>> createState() => _ConfigButtonsWidget<T>();

}


class _CalculationIndexWidget extends State<CalculationIndex> {

  
  Widget build(BuildContext context) {

    var body = Container(
        margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Column(
              children: <Widget>[
                Row(
                  children:<Widget>[
                    Text("Hello mothafucka", style:TextStyle(fontSize:18)), 
                  ]
                ),
                Row(
                  children: <Widget>[
                   Container(
                     width: MediaQuery.of(context).size.width * 0.90, // para pegar em % de tela
                     child: TextField(
                        decoration: InputDecoration(
                        border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(137, 137, 137, 1))
                        ),
                        hintText: 'Enter a search term'
                      ),
                    ),
                    )    

                    
                  ],
                )
              ]
        )
    );





    return Scaffold(
      appBar: null,
          body: Center(heightFactor: 5, child: body),  
      );
  
  





}

 


}
