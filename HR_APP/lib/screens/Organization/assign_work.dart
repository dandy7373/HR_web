
import 'package:HR_APP/services/requests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HR_APP/screens/Organization/org_homescreen.dart';


class AssignWork extends StatefulWidget{

  String email;
  AssignWork(this.email);
  @override
  AssignWorkState createState()=> AssignWorkState(this.email);
}

class AssignWorkState extends State<AssignWork>{

  String email;
  AssignWorkState(this.email);
  @override
  Widget build(BuildContext context){
    List<String> emails=['abs','asd','akjd'];
    String title='new';
    String display;
    int value;
    final details = TextEditingController();
    final startdate=TextEditingController();
    final duedate=TextEditingController();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey[300],
      title: Text('Assign Work Page',style: TextStyle(fontSize: 30,color: Colors.white),)
        ),
        body:Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/img1.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
          child: Center(
          child:Container(
            height: MediaQuery.of(context).size.height-250,
            width: 600,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
            BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
                spreadRadius: 1.0,
                offset: Offset(8.0, 8.0), // shadow direction: bottom right
            )
        ],
              ),
            child: Column(
            children: [
              /*Container(
                height: 100,
                width: 600,
                child:
              ),*/
              SizedBox(height:10),
              Text('Work details',style: TextStyle(fontSize: 20,color: Colors.black),),
              Container(
                height:100,
                width: 500,
                color: Colors.white,
                child: 
                    TextFormField(
                  
                decoration: new InputDecoration(
                contentPadding: new EdgeInsets.symmetric(vertical: 90.0, ),
                  border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
            ),
                  hintText: 'Click here to type work deatils'
                ),
                controller: details,
                ),
                  
                

              ),
              SizedBox(height:10),
              Text('Start date',style: TextStyle(fontSize: 20,color: Colors.black),),
              Container(
                height:50,
                width: 500,
                color: Colors.white,
                child: TextField(
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.all(1.0),
                  border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 10.0),
            ),
                  hintText: 'Click here to type start date'
                ),
                controller: startdate,
                ),

              ),
              SizedBox(height:10),
              Text('Due date',style: TextStyle(fontSize: 20,color: Colors.black),),
              Container(
                height:50,
                width: 500,
                color: Colors.white,
                child:TextField(
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.all(1.0),
                  border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
            ),
                  hintText: 'Click here to type due date'
                ),
                controller: duedate,
                ),

              ),
              SizedBox(height:10),
               Container(
                        height: 50,
                        width: 500,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)

                          ),
                          textColor:Colors.white,
                          color: Colors.blueGrey[300],
                          child: Text('Submit'),
                          onPressed:()async {
                            Map <String,dynamic> data={'email':'daniel.shamirdavid@gmail.com','description':details.text,'start_date':startdate.text,"due_date":duedate.text,"by":'daniel.shamirdavid@gmail.com','completed':0.toString()};
                            var res=await assignwork(data);
                            print(res.success);
                            print('if');
                            if(res.success=='True'){
                              print('if');
                              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>OrganizationHomeScreen(email)));
                            }


                          },

                        )
                    ),
            ],
          ),),
        ),
        ),
    );
  }
  Widget customshow(){
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height:50,
        child: Text('wow'),

      ),

    );
  }
}


