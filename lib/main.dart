

import 'package:flutter/material.dart';
import 'dart:math';
 void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EB BILL CALC',
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        accentColor: Colors.redAccent,
      ),
      home:HomeScreen() ,
    )
  );
  
class HomeScreen extends StatefulWidget {

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  
  String _currentreading = "";
  String _Result ="";

  
  final TextEditingController _currentreadingvalue = TextEditingController();
  

  bool _switchValue = true;

  get value => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EB BILL CALCULATOR'),
        elevation: 0.0
      ),
      body: Center(
        child: Container(
          child: Column(
            children:<Widget> [
              Container(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: _currentreadingvalue,
                  decoration: const InputDecoration(
                    labelText: "Enter current reading"
                  ),
                  keyboardType: TextInputType.number,
                )
        ),
        
    Flexible(
      fit: FlexFit.loose,
      child: FlatButton(
        onPressed: _handleCalculation,
        child: const Text('Calculate'),
        color: Colors.redAccent,
        textColor: Colors.white,
        padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 24.0,right:24.0),
      )
    ),
    ResultsWidget(_Result)
            ],
          )
        )
      )
    );
  }
  void _handleCalculation() {
    var _Result=0;
    var a;
    var b;
    var c;
    UnitValue(_currentreadingvalue){
      if(_currentreadingvalue>500) {
        a=(_currentreadingvalue-500)*6.6;
        b=300*4.6;
        c=100*3.5;
        return a+b+c+50;
         } else if (_currentreadingvalue > 200) {
      a = (_currentreadingvalue - 200) * 3;
      b = 100 * 2;
      return a + b + 30;
    } else if (_currentreadingvalue > 100) {
      a = (_currentreadingvalue - 100) * 1.5;
      return a + 20;
    } else {
      return 0;
    }
  }
      }
     
    // ignore: non_constant_identifier_names
    Widget ResultsWidget(Result) {
      bool canShow =false;
      // ignore: non_constant_identifier_names
      String _Result =Result;
      if(_Result.isNotEmpty){
        canShow = true;
      }
      return
    Container(
      margin: const EdgeInsets.only(top: 40.0),
      child:canShow ? Column(
        children:[
        const Text("Your EB Bill is",
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold
        )
        ),
        Text(_Result,
        style: const TextStyle(
           fontSize: 50.0,
        fontWeight: FontWeight.bold
        ))
        ]
      ):Container()
);
  }
 

}