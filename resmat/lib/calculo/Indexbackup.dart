import 'dart:math';

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
  
  var barLength;
  var torsionValue;

  var diametroValue;
  var powerValue;
  var frequencyValue;
  var shearModulusValue;
  var beamLenghtValue;

  //Pela teoria da torsão
  var torque = 0.00;
   
  var polarMomentus = 0.00;

  var maxShearStress = 0.00;

  var anglePartOne = 0.00;

  var anglePartFinal = 0.00;

  List<Item> itemList = [
      Item("ID1", "First torsion"),
      Item("ID2", "Second torsion"),
    ];
  
    Map<String, int> quantities = {};
  
    void takeNumber(String text, String itemId) {
      try {
        int number = int.parse(text);
        quantities[itemId] = number;
        print(quantities);
      } on FormatException {
  
      }
    } 
  
  Widget singleItemList(int index) {
  Item item = itemList[index];
  
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Row(
      children: [
        Expanded(flex: 1, child: Text("${index + 1}")),
        Expanded(
          flex: 3,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (text) {
              takeNumber(text, item.id);
            },
            decoration: InputDecoration(
              labelText: "Quantity: ",
            ),
          ),
        ),
      ],
    ),
  );
   }
  
    Widget build(BuildContext context) {
        var btnVoltar =  FlatButton( 
                      onPressed: ( ) {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()),     ModalRoute.withName("/Home") ); },                                          child: Row(
                        children: <Widget>[
                        SizedBox(
                        child: Image.asset('images/arrow.png'),
                        width: 20),
                        Align(alignment:  Alignment.topLeft,child: Text("Voltar",textAlign: TextAlign.left, style: TextStyle(fontSize: 25, fontFamily: 'Myriad-Regular',  color: Color.fromRGBO(77, 76, 76, 1))))
                      ],
                    )
                  );
  
      var body = Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
  
          child: 
          ListView(
            scrollDirection: Axis.vertical,
            reverse: true,
            children: <Widget>[
              Column(
                children: <Widget>[
                 btnVoltar,
                  Row(
                    children:<Widget>[
                      Text("Tamanho da barra: ", style:TextStyle(fontSize:18)), 
                      RaisedButton(
                        onPressed: (){
                          calculo();
                        } 
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                     Container(
                       width: MediaQuery.of(context).size.width * 0.90, // para pegar em % de tela
                       child: TextField(
                          onChanged: (text){
                            barLength= text;
                          },
                          decoration: InputDecoration(
                          border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromRGBO(137, 137, 137, 1))
                          ),
                          hintText: 'Entre com o tamanho da barra'
                        ),
                      ),
                      )  
                    ],
                  ),
  
                  Row(
                    children:<Widget>[
                      
                      Text("Adicionar ponto de torção:", style:TextStyle(fontSize:18)), 
                      RaisedButton(
                        onPressed: (){
                          print(torsionValue + "Torção: ");
                        },
  
  
                      )
                    ],
                  ),
  
                  Row(
                    children: <Widget>[
                     Container(
                       width: MediaQuery.of(context).size.width * 0.90, // para pegar em % de tela
                       child: TextField(
                          onChanged: (text){
                            torsionValue = text;
                          },
                          decoration: InputDecoration(
                          border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromRGBO(137, 137, 137, 1))
                          ),
                          hintText: 'Enter a search term'
                        ),
                      ),
                      )    
                    ],
                  ),
  
  
                  Row(
                    children:<Widget>[
                      Text("Frequência:", style:TextStyle(fontSize:18)), 
                      RaisedButton(
                        onPressed: (){
                          print(frequencyValue+"Frequency Value");
                        } ,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                     Container(
                       width: MediaQuery.of(context).size.width * 0.90, // para pegar em % de tela
                       child: TextField(
                          onChanged: (text){
                            frequencyValue = text;
                          },
                          decoration: InputDecoration(
                          border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromRGBO(137, 137, 137, 1))
                          ),
                          hintText: 'Enter a search term'
                        ),
                      ),
                      )    
  
                      
                    ],
                  ),
  
  
                  Row(
                    children:<Widget>[
                      Text("Módulo de Cisalhamento:", style:TextStyle(fontSize:18)), 
                      RaisedButton(
                        onPressed: (){
                          print(shearModulusValue + "Shear Modulus Value");
                        } ,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                     Container(
                       width: MediaQuery.of(context).size.width * 0.90, // para pegar em % de tela
                       child: TextField(
                          onChanged: (text){
                            shearModulusValue = text;
                          },
                          decoration: InputDecoration(
                          border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromRGBO(137, 137, 137, 1))
                          ),
                          hintText: 'Enter a search term'
                        ),
                      ),
                      )    
  
                      
                    ],
                  ),
  
                  
                    Row(
                    children:<Widget>[
                      Text("Comprimento (metros):", style:TextStyle(fontSize:18)), 
                      RaisedButton(
                        onPressed: (){
                          print(beamLenghtValue+"Beam Lenght");
                        } ,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                     Container(
                       width: MediaQuery.of(context).size.width * 0.90, // para pegar em % de tela
                       child: TextField(
                          onChanged: (text){
  
                            beamLenghtValue = text;
                          },
                          decoration: InputDecoration(
                          border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromRGBO(137, 137, 137, 1))
                          ),
                          hintText: 'Enter a search term'
                        ),
                      ),
                      )    
  
                      
                    ],
                  ),
  
                ]
              )
            ],
          )
          
      );
  
  
  
  
      return Scaffold(
        appBar: null,
            body:  Center(heightFactor: 0.8, child: body),  
                
        );
  
        
    
    
  
    
  
  
  
  }
  
  
  
   
  void calculo(){
      setState(() {
  
      //Pela teoria da torsão
        torque = 
        double.parse(powerValue) / (double.parse(frequencyValue) * ((2 * pi) )); // Valor do torque em kN m
        print("Torque $torque");
  
        polarMomentus = 
          (pi / 32) * (pow(double.parse(diametroValue), 4)); //Cálculo do momento polar
        print("Momento Polar $polarMomentus");
  
        maxShearStress =
          (torque * (double.parse(diametroValue) / 2)) / polarMomentus; // Tensao maxima de cisalhamento
        print("Máximo Cisalhamento $maxShearStress");
  
        anglePartOne =
          (torque * double.parse(beamLenghtValue) ) / (double.parse(shearModulusValue) * polarMomentus); //theta
        print("Angulo Parte 1 $anglePartOne");
  
        anglePartFinal = 
          (anglePartOne * (360 / (2 * pi))); //theta em graus / m
        print("Angulo Parte Final $anglePartFinal");
  
          print("Cisalhamento Maximo:$maxShearStress  Angulo Parte Final :$anglePartFinal");
  
      });
  }
  
  
  
  
  }
  
  class Item {
     final String id;
  final String name;

  Item(this.id, this.name);
}
