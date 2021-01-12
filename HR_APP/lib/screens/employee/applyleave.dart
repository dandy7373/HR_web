import 'package:flutter/material.dart';
import 'package:HR_APP/services/requests.dart';


class ApplyLeave extends StatefulWidget {
  String email;
  ApplyLeave(this.email);
  @override
  ApplyLeaveState createState() => ApplyLeaveState(email);
}


class ApplyLeaveState extends State<ApplyLeave>{
  String email;
  ApplyLeaveState(this.email);
  
  @override
  Widget build(BuildContext context){
    
    final myController = TextEditingController();
    final fromdatecontroller=TextEditingController();
    final todatecontroller=TextEditingController();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey[300],
      title: Text('Apply leave')
        ),
        body: Center(
          child: Container(
            height: 500,
            width: 500,
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
              Container(
             height: 50,
             width: 500,
             child: Center(child: Text('Apply Leave',style: TextStyle(color: Colors.white),),),
             decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) ),color: Colors.blueGrey[300]),
              ),
              Text('Starting date'),
              Container(
                height:50,
                width: 490,
                decoration: BoxDecoration(border:Border.all(color: Colors.black)),
                child: TextField(
                decoration: new InputDecoration.collapsed(
                  hintText: 'dd/mm/yyyy'
                ),
                controller: fromdatecontroller,
                ),

              ),
              Text('End date of the leave'),
              Container(
                height:50,
                width: 490,
                decoration: BoxDecoration(border:Border.all(color: Colors.black)),
                child:TextField(
                decoration: new InputDecoration.collapsed(
                  hintText: 'dd/mm/yyyy'
                ),
                controller: todatecontroller,
                ),

              ),
              Text('Reason for the leave'),
              Container(
                height:100,
                width: 490,
                decoration: BoxDecoration(border:Border.all(color: Colors.black)),
                child:  TextField(
                  decoration:new InputDecoration.collapsed(
                  hintText: 'Please type the reason here',
                  hoverColor: Colors.blueGrey[300]
                ),
                controller: myController,
                ),
              ),
              SizedBox(height: 10,),
               Container(
                        height: 50,
                        width: 490,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)

                          ),
                          textColor:Colors.white,
                          color: Colors.blueGrey[300],
                          child: Text('Submit'),
                          onPressed:()async {
                            var res=await applyleave({'from_date':fromdatecontroller.text,'to_date':todatecontroller.text,'reason':myController.text,'completed':'False','from_email':email});
                            print(res.data['success']);
                          },

                        )
                    ),
            ],
          ),),
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



/// This is the stateless widget that the main application instantiates.

