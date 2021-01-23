import 'package:flutter/material.dart';
import 'package:HR_APP/screens/employee/applyleave.dart';
import 'package:HR_APP/screens/employee/all_leaves.dart';
import 'package:HR_APP/screens/employee/homescreen.dart';
import 'package:HR_APP/services/requests.dart';
class EmployeeHomeScreen extends StatefulWidget {
  String email;
  EmployeeHomeScreen(this.email);
  @override
  EmployeeHomeScreenState createState() => EmployeeHomeScreenState(email);
}



class EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  String email;
  EmployeeHomeScreenState(this.email);
  @override
  Widget build(BuildContext context) {
        var _works=[{'description':'Python API','due_date':'20/01/21','start_date':'01/01/2021'},{'description':'Flutter app','due_date':'20/02/21','start_date':'21/01/2021'},{'description':'Rest API in node js','due_date':'20/03/21','start_date':'01/03/2021'},{'description':'Testing','due_date':'20/04/21','start_date':'05/04/2021'},];
        return Scaffold(
          appBar: AppBar(
            title: Container(
              child:Row(
                children: [
                  Text('App Name'),
                  SizedBox(width:100),
                InkWell(child:Text('Home',style: TextStyle(fontStyle:FontStyle.italic),),
                onTap: (){},),
                SizedBox(width: 30,),
                InkWell(child:Text('Apply leave',style: TextStyle(fontStyle:FontStyle.italic),),
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ApplyLeave(email)));},),
                SizedBox(width:30),
                InkWell(child:Text('Approved leaves',style: TextStyle(fontStyle:FontStyle.italic),),
                onTap:(){Navigator.of(context).push(MaterialPageRoute(builder:(context)=>AllLeave(email)));}),
                SizedBox(width:30),
                InkWell(child:Text('profile',style: TextStyle(fontStyle:FontStyle.italic),),onTap:(){})
              ],)
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_alert),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  
                },
              ),
              IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Next page',
                onPressed: () {
                  
                },
              ),
            ],
            backgroundColor: Colors.blueGrey[300],
          ),
          body:  FutureBuilder(
            future: works({'email':email}),
            builder:(context,snapshot){
              print(snapshot.data.data);
              return Container(
            height: 700,
            child:Center(
            child: Column(
              children:[
                SizedBox(height:50),
                Container(
                  height:50,
                  width: 600,
                  child: Center(child:Text('Upcoming works')),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[300],
                borderRadius: BorderRadius.only(topRight:Radius.circular(20),topLeft:Radius.circular(20) ),),
                ),
                Container(
              height: 500,
              width: 600,
              child: ListView.builder(itemBuilder: (context,count){
                return Card(
                  child: Container(
                    height: 100,
                    child:Center(child: Column(children: [
                      Container(child: Row(children:[
                        Text('Description:'+_works[count]['description']),
                      ]),),
                      Container(child: Row(children:[
                        Text('Start date of the project :'+_works[count]['start_date']),
                      ]),),
                      Container(child: Row(children:[
                        Text('Project Deadline:'+_works[count]['due_date']),
                      ]),)
                    ],),),
                  ),
                );
              },
              itemCount:_works.length
              ),
              
        ),],
      ),
        ),
      );}),
    );
  }
}
