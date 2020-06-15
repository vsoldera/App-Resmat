import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resmat/Configurations.dart';
import '../SharedSettings.dart';
import '../Language.dart';
import '../Configurations.dart';
import '../Home.dart';
import 'index.dart';
import 'template1.dart';
import 'dart:math';



 class ResultTemplate1 extends StatefulWidget {
  Dados dados1 =new Dados();
  ResultTemplate1({Key key, @required this.dados1}) : super(key: key);
  
   _ResultTemplate1Widget createState() => _ResultTemplate1Widget(dados2: dados1);
}

class _ResultTemplate1Widget extends State<ResultTemplate1> {
  Dados dados2 =new Dados();
  _ResultTemplate1Widget({Key key, @required this.dados2});
  
  //Pela teoria da torsão
  var torque = 0.00;
   
  var polarMomentus = 0.00;

  var maxShearStress = 0.00;

  var anglePartOne = 0.00;

  var anglePartFinal = 0.00;
    
  var pi = 3.141516;
  
  Widget build(BuildContext context) {
    //print("raio:"+dados2.getRaio().toString());
    //print("tamanho barra:"+dados2.getTamanhoBarra().toString());
    //print("Modulo de Cisalhamento:"+dados2.getModuloCisalhamento().toString());
    print("torque"+dados2.torques.toString());
    print("posicao X"+ dados2.posicaoX.toString());
        

    final double num = ModalRoute.of(context).settings.arguments;//total de itens enviados quanto a torque e 
   print("n"+ num.toString());

    sort(num); // ira ordenar as posicoes X, em contrapartida leva junto os torques

    print("torques: "+dados2.torques.toString());
    print("posicao X"+ dados2.posicaoX.toString());

    polarMomentus = 
      (pi / 32) * (pow((dados2.getRaio()*2), 4)); //Cálculo do momento polar
    print("Momento Polar $polarMomentus");
  
    //print("Cisalhamento Maximo:$maxShearStress  Angulo Parte Final :$anglePartFinal");


    double angulo_total = getAnguloRadianos(num, polarMomentus);

    print("Angulo Total: "+ angulo_total.toString() );


    // TODO: implement build
     return new Scaffold(
      appBar: null,
        body: Container(padding: EdgeInsets.fromLTRB(0, 150, 0, 0),height: 1500, 
        child:  FlatButton(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                onPressed: () {
                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CalculationIndex()),     ModalRoute.withName("/Calculation Index") ); 
                },
                child: Row(
                  children: <Widget>[
                    SizedBox(child: Image.asset('images/arrow-rosa.png'), width: 20),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(" "+AppLocalizations.of(context).translate("template1", 'en', "backButtonText"),
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
        )

        
        
        );
  }



    void sort(double n){
      double aux;
        for(int i=0;i<n - 1;i++){
          for (int j = 0; j < n-i-1; j++){
              if (dados2.posicaoX[j] > dados2.posicaoX[j+1])  {
                  aux = dados2.posicaoX[j];
                  dados2.posicaoX[j] = dados2.posicaoX[j+1];
                  dados2.posicaoX[j+1] = aux;
                  aux = dados2.torques[j];
                  dados2.torques[j] = dados2.torques[j+1];
                  dados2.torques[j+1] = aux;
              }
            }
          }
        }

    double getAnguloRadianos(double num, double polar){
      double angulo_total=0.00;

      double torque_atual = 0.00;
    
      for(int i=0;i<num;i++){
          torque_atual = torque_atual + dados2.torques[i];
        if(i<num-1){
            angulo_total += ( -1*torque_atual*(dados2.posicaoX[i+1]-dados2.posicaoX[i]))/(dados2.getModuloCisalhamento() * polar);
        }
        else{
            angulo_total += ( -1*torque_atual * dados2.getTamanhoBarra() - dados2.posicaoX[i]) /(dados2.getModuloCisalhamento() * polar);
        }
      }

      return angulo_total;
    }

}

