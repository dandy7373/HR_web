import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:HR_APP/screens/employee/homescreen.dart';
import 'package:HR_APP/screens/Organization/orglogin.dart';
import 'package:HR_APP/screens/employee/emp_signin.dart';


void main() => runApp(LoginScreen());

/// This is the main application widget.
class LoginScreen extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Firstscreen(),
    );
  }
}
class Firstscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(

        
        child:Container(
          height:250,
          width: 100,
          child:Column(
            children:[ 
              RaisedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>LoginorRegister()));
              },
          child: Text("Organization")),
          SizedBox(height:20),
            RaisedButton(
            child: Text("employee"),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EmpLoginorRegister()));
            },)
            ]
          
    )),)
      
    );
  }
  }
