import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FancyFAB.dart';

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

class ConfigButtons extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 3,
      child: Container(
        child: Column(
          children: [ //Widget
            Text('Linguagens: ', style: TextStyle(fontSize: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ 
                const SizedBox(),
                ButtonTheme(
                  minWidth: 150,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('Inglês', style: TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(),
                ButtonTheme(
                  minWidth: 150,
                  child: RaisedButton(
                    onPressed: () {},
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
}
