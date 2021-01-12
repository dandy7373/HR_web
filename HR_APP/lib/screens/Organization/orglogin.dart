import 'package:HR_APP/services/requests.dart';
import 'package:flutter/material.dart';
import 'package:HR_APP/screens/Organization/org_signup.dart';
import 'package:HR_APP/screens/Organization/org_homescreen.dart';
class LoginorRegister extends StatelessWidget{
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
                child:Center(child:Text('HR Sign In')),
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
                            var res=await loginorg(email.text, password.text);
                            if(res.success=='True'){
                              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>OrganizationHomeScreen(email.text)));
                            }
                          },

                        )
              ),
              SizedBox(height:20),
              
              SizedBox(height:20),
              Container(
                height: 50,
                width: 300,
                child:Row(
                  children: [
                    Text("Don't have an account?"),
                    InkWell(
                        child: new Text('  Sign Up',style: TextStyle(color:Colors.blueGrey[300] ),),
                        onTap: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EmployeeHomeScreen()));
                          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Orgsignup()));
                        }
                    ),
                  ],
                ),
              )
              
            ]
          ),
        )
      )
    );
    
  }
}