/*Center(
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
        ), */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HR_APP/services/requests.dart';
class AllLeave extends StatefulWidget{
  String email;
  AllLeave(this.email);
  AllLeaveState createState()=>AllLeaveState(email);
}
class AllLeaveState extends State<AllLeave>{
  String email;
  AllLeaveState(this.email);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey[300],
      title: Text('Apply leave')
        ),
        body: FutureBuilder(
          future:allleave({'email':email}),
          builder:(context,snapshot){
            if(snapshot.connectionState ==ConnectionState.waiting){
              return Center(
                child: Text('Loading...'),
              );

            }
            List<Map> approved=[];
            print(snapshot.data.data['leaves']);
            print(snapshot.data.data['leaves'][0]['completed']);
            for(int i=0;i<List.from(snapshot.data.data['leaves']).length;i++){
              if(List.from(snapshot.data.data['leaves'])[i]['completed']=='True'){
                approved.add(List.from(snapshot.data.data['leaves'])[i]);
              }
            }
            if(approved.length==0){
              return Center(child: Text('Nothing to show'),);
            }
            return Center(
          child: Column(
            children: [
              SizedBox(height:50),
              Container(
                
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[300],
                borderRadius: BorderRadius.only(topRight:Radius.circular(20),topLeft:Radius.circular(20) ),),
                
                height:50,
                width:600,
                child: Center(child:Text('Approved Leaves',style: TextStyle(color: Colors.white,fontSize: 20))),
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
                          Text('Description '+approved[count]['reason']),
                          Text('Started on '+approved[count]['from_date']),
                          Text('due date '+approved[count]['to_date']),
                        ]
                      ),),),
                  );
                },
                itemCount: approved.length,),
              )
            ],
          ),
        );
  }), 
    );
  }
  
}

