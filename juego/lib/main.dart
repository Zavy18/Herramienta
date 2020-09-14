import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de temperatura',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Conversos(title: 'Conversor de temperatura'),
    );
  }
}

class Conversos extends StatefulWidget {
  Conversos({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ConversoState createState() => _ConversoState();
}

class _ConversoState extends State<Conversos> {
var _output = "Inicial";
final inputController = TextEditingController();

void _calculateTemp(){
  setState(() {
    double temperatura_original = double.parse(inputController.text);
    double temperatura_salida = (temperatura_original - 32) * 5 / 9;
    _output = "$temperatura_salida";
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: inputController,
              ),
              RaisedButton(
                onPressed: (){
                  _calculateTemp();
                },
                child:  Text('Convertir'),
              ),
              Text(_output),
          ]
        )
        
        ),
      )
    );
  }
}