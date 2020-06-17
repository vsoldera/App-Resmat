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
import 'package:charts_flutter/flutter.dart' as charts;


class GrafTorcao {
  final double x;
  final double y;

  GrafTorcao(this.x, this.y);
}

List<GrafTorcao> myFakeTabletData = new List();
/* GRAFICO*/
class SimpleNullsLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleNullsLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleNullsLineChart.withSampleData() {
    return new SimpleNullsLineChart(
      _createSampleData(myFakeTabletData),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate);
  }

  
  /// Create one series with sample hard coded data.
  static List<charts.Series<GrafTorcao, double>> _createSampleData(List<GrafTorcao> myFakeTabletData) {

   for(int i=0; i<10;i++){
     print("---p2\n"+myFakeTabletData.toList().toString());
   }

    //final myFakeTabletData = [
   //   new GrafTorcao(0, 10),
   //   new GrafTorcao(1, 30),
    //  new GrafTorcao(2, 50),
    //  new GrafTorcao(3, 150),
    //  new GrafTorcao(4, 200),
    //  new GrafTorcao(5, 180),
    //  new GrafTorcao(6, 150),
  //  ];

    



    return [
      new charts.Series<GrafTorcao, double>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (GrafTorcao sales, _) => sales.x,
        measureFn: (GrafTorcao sales, _) => sales.y,
        data: myFakeTabletData,
      ),

    ];
  }
}

/// Sample linear data type.


/*FIM GRAFICO*/





  Future<String> switchDeLinguagem;



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
    //print("raio:"+dados2.getRaio().toString());
    //print("tamanho barra:"+dados2.getTamanhoBarra().toString());
    //print("Modulo de Cisalhamento:"+dados2.getModuloCisalhamento().toString());
    //print("torque"+dados2.torques.toString());
   // print("posicao X"+ dados2.posicaoX.toString());
        

    final double num = ModalRoute.of(context).settings.arguments;//total de itens enviados quanto a torque e 
   //print("n"+ num.toString());

    sort(num); // ira ordenar as posicoes X, em contrapartida leva junto os torques

    //print("torques: "+dados2.torques.toString());
    //print("posicao X"+ dados2.posicaoX.toString());

    polarMomentus = 
      (pi / 32) * (pow((dados2.getRaio()*2), 4)); //Cálculo do momento polar
    //print("Momento Polar $polarMomentus");
  
    //print("Cisalhamento Maximo:$maxShearStress  Angulo Parte Final :$anglePartFinal");


    double angulo_total = getAnguloRadianos(num, polarMomentus);

    //print("Angulo Total: "+ angulo_total.toString() );


    // TODO: implement build
     return new Scaffold(
      appBar: null,
        body: Container(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),height: 1500, 
        child:  Container(
          child:
        FutureBuilder(
          future: switchDeLinguagem,
          builder: (context, snap){
            print("snap nome: "+snap.data);
            if(snap.hasData){

              return 
              ListView(
                  
                  children: <Widget>[
                  Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: 
                  Align(
                    alignment: Alignment.topCenter,
                    child:FlatButton( 
                      onPressed: ( ) {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Template1()),     ModalRoute.withName("/Template1") ); },
                      child: Row(
                      children: <Widget>[
                      SizedBox(
                      child: Image.asset('images/arrow-rosa.png'),
                      width: 20),
                      Align(alignment:  Alignment.topLeft,child: Text(" "+AppLocalizations.of(context).translate("resultTemplate1", snap.data, "backButtonText"),textAlign: TextAlign.left, style: TextStyle(fontSize: 25, fontFamily: 'Myriad-Regular',  color:Color.fromRGBO(255, 85, 113, 1))))
                      ],
                      ) 
                      )
                  ),
                
                ),
                SizedBox(height: 20),

                Align(alignment:  Alignment.topCenter, child: Text(AppLocalizations.of(context).translate("resultTemplate1", snap.data, "title1"), 
                      style: TextStyle(fontSize: 20, fontFamily: 'Myriad-Regular',  color: Color.fromRGBO(114, 114, 114, 1) ))),
                Align(alignment:  Alignment.topCenter, child: Text(polarMomentus.toStringAsExponential(),
                      style: TextStyle(fontSize: 25, fontFamily: 'Myriad-Bold',  color: Color.fromRGBO(255, 85, 113, 1) ))),
                Align(alignment:  Alignment.topCenter, child: Text(AppLocalizations.of(context).translate("resultTemplate1", snap.data, "title2"), 
                      style: TextStyle(fontSize: 20, fontFamily: 'Myriad-Regular',  color: Color.fromRGBO(114, 114, 114, 1) ))),
                Align(alignment:  Alignment.topCenter, child: Text(angulo_total.toStringAsExponential(), 
                      style: TextStyle(fontSize: 25, fontFamily: 'Myriad-Bold',  color: Color.fromRGBO(255, 85, 113, 1) ))),

                SizedBox(height: 20),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: SimpleNullsLineChart.withSampleData()),
                ],
              );   
              
        
            }
            else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
            
          )
        
        )
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
      myFakeTabletData.clear();
      double torque_atual = 0.00;

      for(int i=0;i<num;i++){
          torque_atual = torque_atual + dados2.torques[i];
        if(i<num-1){
            myFakeTabletData.add(GrafTorcao(dados2.posicaoX[i],torque_atual));
            myFakeTabletData.add(GrafTorcao(dados2.posicaoX[i+1],torque_atual));
            myFakeTabletData.add(GrafTorcao(null,null));
           // print("ponto--------------------------------------------\n");
           // print(" "+dados2.posicaoX[i].toString()+","+torque_atual.toString());
           // print(" "+dados2.posicaoX[i+1].toString()+","+torque_atual.toString());
            angulo_total += ( torque_atual*(dados2.posicaoX[i+1]-dados2.posicaoX[i]))/(dados2.getModuloCisalhamento() * polar);
        }
        else{
            myFakeTabletData.add(GrafTorcao(dados2.posicaoX[i],torque_atual));
            myFakeTabletData.add(GrafTorcao(dados2.getTamanhoBarra(),torque_atual));
           // print("ponto Final--------------------------------------------\n");
           // print(" "+dados2.posicaoX[i].toString()+","+torque_atual.toString());
           // print(" "+dados2.getTamanhoBarra().toString()+","+torque_atual.toString());
            angulo_total += ( torque_atual * dados2.getTamanhoBarra() - dados2.posicaoX[i]) /(dados2.getModuloCisalhamento() * polar);
        }
      }



      return angulo_total;
    }

  void initState(){
    switchDeLinguagem = verificaSetLinguagemDeUsuario(); // a chamada de valor DEVE SER SEMPRE antes do initSate*** devido a arvore de construcao do widget
    super.initState();
  }
}

