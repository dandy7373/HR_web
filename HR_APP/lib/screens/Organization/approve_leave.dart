import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:HR_APP/services/requests.dart';


class ApproveLeave extends StatefulWidget{
  String email;
  ApproveLeave(this.email);
  @override
  ApproveLeaveState createState()=> ApproveLeaveState(email);
}

class ApproveLeaveState extends State<ApproveLeave>{
  String email;
  ApproveLeaveState(this.email);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey[300],
      title: Text('Leave Page')
        ),
        body: FutureBuilder(
          future: getorgleaves({'email':email}),
          builder:(context,snapshot){
            if(snapshot.connectionState ==ConnectionState.waiting){
              return Center(
                child: Text('Loading...'),
              );

            }
            if(snapshot.hasData==false){
              return Center(child: Text('Nothing to show!'),);
            }
            print('data');
            print(snapshot.data.value);
            if(snapshot.data.value['success']=='False'){
              return Text('Something went wrong');
            }
            List<Map> leaves=[];
            
            leaves=List.from(snapshot.data.value['leaves']);
            if(leaves.length==0){
              return Text('No leaves to be approved');
            }
            
            return Center(
          child: Column(
            children: [
              SizedBox(height:50),
              Container(
                color: Colors.blueGrey[300],
                height:50,
                width:600,
                child: Text('Pending Approvals'),
              ),
              Container(
                width:600,
                height: 400,
                child: ListView.builder(itemBuilder: (context,count){
                  return GestureDetector(
                    onTap: ()async{
                      print(true);
                      print(count);
                      var data={'index':count.toString(),"from_date":leaves[count]['from_date'],'to_date':leaves[count]['to_date'],'reason':leaves[count]['reason'],'completed':'False','to_email':email,'from_email':leaves[count]['from_email']};
                      var res= await approveleave(data);
                      print(res.success);
                    },
                    child:Card(
                    child: Container(
                      height:100,
                      width: 400,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0,
                              spreadRadius: 1.0,
                              offset: Offset(4.0, 4.0), // shadow direction: bottom right
                          )
                      ],
                      ),
                    child:Column(
                      children: [
                        Text('Applied by: '+leaves[count]['from_email']),
                        Text('from date: '+leaves[count]['from_date']),
                        Text('to_date:'+leaves[count]['to_date']),
                        Text('Reason: '+leaves[count]['reason'])
                        /*InkWell(child:Text('Approve leave',style: TextStyle(fontStyle:FontStyle.italic,color: Colors.blue),),
                        onTap: ()async{
                          //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ApproveLeave(email)));
                        },
                        ),*/
                      ],
                    ) ,
                    ),
                  ),
                  );
                },
                itemCount: leaves.length,),
              )
            ],
          ),
        );
  }
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