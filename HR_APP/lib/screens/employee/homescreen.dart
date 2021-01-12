import 'package:flutter/material.dart';
import 'package:HR_APP/screens/employee/applyleave.dart';
import 'package:HR_APP/screens/employee/all_leaves.dart';
import 'package:HR_APP/screens/employee/homescreen.dart';
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
          body:  Container(
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
                    child:Text('hello'),
                  ),
                );
              },
              itemCount:10
              ),
              
        ),],
      ),
        ),
      ),
    );
  }
}
