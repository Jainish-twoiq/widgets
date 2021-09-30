import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
  home : MyApp(),
));

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //textfield
  String _value = '';

  void _onChange(String value){
    setState(() => value = 'Change : ${value}');
  }
  void _onSubmit(String value){
    setState(() => value = 'Submit : ${value}');
  }
  //switch
  bool _a1 = false;
  void onChange1(bool a) => setState(() => _a1 = a);

  //slider
  double _b1 = 0.0;
  void _setb(double b) => setState(() => _b1 = b);

  //datepicker
  String _c1 = '' ;

  Future _selectDate() async{
      DateTime? picked =  await showDatePicker(context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2016),
          lastDate: DateTime(2019));
      if(picked != null) setState(() => _c1 =picked.toString());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
        'Widget Demo Page '
       ),
    ),
    body: Container(
    padding: EdgeInsets.all(32.0),
    child: Center(
    child: Column(
    children: <Widget>[
      Text(
        _value
      ),
      TextField(
        decoration: InputDecoration(
          labelText: 'Hello',
          hintText: 'Hint',
          icon : Icon(Icons.people),
        ),
        autocorrect: true,
        autofocus: true,
          keyboardType: TextInputType.text,
          onChanged: _onChange,
          onSubmitted: _onSubmit,
               ),
            Switch(value: _a1, onChanged: onChange1),
            Text ('Value : ${(_b1 * 100).round()}'),
      Slider(value: _b1, onChanged: _setb),
      Text(_c1),
      ElevatedButton(onPressed: _selectDate, child: Text('click me')),
             ],
           ),
         ),
        ),
      );
    }
  }
