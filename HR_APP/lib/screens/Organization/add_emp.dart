import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HR_APP/services/requests.dart';
import 'package:HR_APP/screens/Organization/org_homescreen.dart';

class Addemployee extends StatelessWidget{
  String fromemail;
  Addemployee(this.fromemail);
  @override
  Widget build(BuildContext context){
    final name=TextEditingController();
    final email=TextEditingController();
    final password=TextEditingController();

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey[300],
      title: Text('Add employes')
        ),
        body: Center(
          child: Column(
            children: [
              /*Container(
                height: 100,
                width: 600,
                child:
              ),*/
              SizedBox(height:50),
              Container(
                height:50,
                width: 300,
                
                child: Stack(
                  children: [
                    TextFormField(
                  
                decoration: new InputDecoration(
                  border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
            ),
                  hintText: 'Click here to name of the employees'
                ),
                controller: name,
                ),
                  ],
                ),

              ),
              SizedBox(height:20),
              Container(
                height:50,
                width: 300,
                child: TextField(
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.all(1.0),
                  border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
            ),
                  hintText: 'Click here to type email '
                ),
                controller: email,
                ),

              ),
              SizedBox(height:20),
              Container(
                height:50,
                width: 300,
                child:TextField(
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.all(1.0),
                  border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
            ),
                  hintText: 'Click here to type password'
                ),
                controller: password,
                ),

              ),
               Container(
                        height: 50,
                        width: 300,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)

                          ),
                          textColor:Colors.white,
                          color: Colors.blueGrey[300],
                          child: Text('Submit'),
                          onPressed:()async {
                            var data={'email':email.text,'password':password.text,'name':name.text,'from_email':fromemail};
                            var res=await addemp(data);
                            print(res.success);
                            if(res.success=='True'){
                              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>OrganizationHomeScreen(fromemail)));
                            }
                          },

                        )
                    ),
            ],
          ),
        ),
    );
  }
}