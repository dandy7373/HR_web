
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HR_APP/screens/Organization/assign_work.dart';
import 'package:HR_APP/screens/Organization/approve_leave.dart';
import 'package:HR_APP/screens/Organization/add_emp.dart';
import 'package:HR_APP/services/requests.dart';

class OrganizationHomeScreen extends StatefulWidget{
  String email;
  OrganizationHomeScreen(this.email);
  @override
  OrganizationHomeScreenState createState()=> OrganizationHomeScreenState(email);
}
class OrganizationHomeScreenState extends State<OrganizationHomeScreen>{
  String email;
  OrganizationHomeScreenState(this.email);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey[300],
      title: Container(
              child:Row(
                children: [
                  InkWell(child:Text('App Name'),
                  onTap: (){},
                  ),
                  SizedBox(width:100),
                InkWell(child:Text('Home',style: TextStyle(fontStyle:FontStyle.italic),),
                onTap: (){},
                ),
                SizedBox(width: 30,),
                InkWell(child:Text('Approve leave',style: TextStyle(fontStyle:FontStyle.italic),),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ApproveLeave(email)));
                },
                ),
                SizedBox(width:30),
                InkWell(child:Text('Assign work',style: TextStyle(fontStyle:FontStyle.italic),),
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder:(context)=>AssignWork(email)));},
                ),
                SizedBox(width:30),
                InkWell(child:Text('Add an employee',style: TextStyle(fontStyle:FontStyle.italic),),
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Addemployee(email)));},
                ),
                SizedBox(width:30),
                InkWell(child:Text('profile',style: TextStyle(fontStyle:FontStyle.italic),),
                onTap: (){},)
              ],)
            ),
      ),
        
        body: FutureBuilder(
          future: getwork({'email':email}),
          builder:(context,snapshot){
            if(snapshot.connectionState ==ConnectionState.waiting){
              return Center(
                child: Text('Loading...'),
              );

            }
            print(snapshot.data.data);
            List<Map> works=[];
            for(int i=0;i<snapshot.data.data['works'].length;i++){
              if(snapshot.data.data['works'][i]['completed']=='0'){
                works.add(snapshot.data.data['works'][i]);
              }
            }

          return Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/img1.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
          child:Center(
          child: Column(
            children: [
              SizedBox(height:50),
              Container(
                
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[300],
                borderRadius: BorderRadius.only(topRight:Radius.circular(20),topLeft:Radius.circular(20) ),),
                
                height:50,
                width:600,
                child: Center(child:Text('Pending works',style: TextStyle(color: Colors.white,fontSize: 20))),
              ),
              Container(
                width:600,
                height: 400,
                child: ListView.builder(itemBuilder: (context,count){
                  return Card(
                    child: Container(
                      height:100,
                      child: Center(child: Column(
                        children:[
                          Text('Description '+ works[count]['description']),
                          Text('Started on '+works[count]['start_date']),
                          Text('due date '+works[count]['due_date']),
                        ]
                      ),),),
                  );
                },
                itemCount: works.length,),
              )
            ],
          ),
        ),
        );}
        ),
    );
  }
}
