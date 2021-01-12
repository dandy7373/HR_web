import 'package:HR_APP/services/requests.dart';
import 'package:flutter/material.dart';
import 'package:HR_APP/screens/employee/homescreen.dart';
class EmpLoginorRegister extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final email=TextEditingController();
    final password=TextEditingController();
    return Scaffold(
      body: Center(
        
        child:Container(
          height: 500,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
            BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
        ],
              ),
          child: Column(
            children:<Widget>[

              Container(
                height: 50,
                width:300,
                child:Center(child:Text('Employee Sign In')),
                /*decoration: BoxDecoration(
                  color: Colors.blueGrey[300],
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),*/),
              SizedBox(height:20),
              Container(
                height: 50,
                width: 300,
                child:TextField(
                decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email'
                ),
                controller: email,
                ),
              ),
              SizedBox(height:20),
              Container(
                height: 50,
                width: 300,
                child:TextField(
                decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter password'
                ),
                controller: password,
                ),
              ),
              SizedBox(height:20),
              Container(
                height: 50,
                width: 300,
                child:RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)

                          ),
                          textColor:Colors.white,
                          color: Colors.blueGrey[300],
                          child: Text('Sign In'),
                          onPressed:()async {
                            var res=await emplogin({'email':email.text, 'password':password.text});
                            print(res.data['success']);
                            if(res.data['success'].toString()=='true'){
                              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EmployeeHomeScreen(email.text)));
                            }
                          },

                        )
              ),
              
              
            ]
          ),
        )
      )
    );
    
  }
}