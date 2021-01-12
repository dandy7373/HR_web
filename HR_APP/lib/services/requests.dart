import 'package:HR_APP/screens/Organization/approve_leave.dart';
import 'package:HR_APP/screens/Organization/assign_work.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Registerstatus{
  String success;

  Registerstatus({this.success});

  factory Registerstatus.fromJson(Map<String,dynamic> json){
    return Registerstatus(success: json['success']);
  }
}

Future<Registerstatus> registerorg(String email,String password,String name,String name_org)async{
  print('emtered');
  final response= await http.post('http://127.0.0.1:8000/api/org_signup',body:{'email':email.toString(),'name':name.toString(),'password':password.toString(),'name_org':name_org.toString()});
  if(response.statusCode==200){
    return Registerstatus.fromJson(jsonDecode(response.body));
  }
  return Registerstatus.fromJson(jsonDecode(response.body));
}

class LoginStatus{
  String success;

  LoginStatus(this.success);

  factory LoginStatus.fromJson(Map<String, dynamic> json){
    return LoginStatus(json['success']);
  }
}
Future<LoginStatus> loginorg(String email, String password)async{
  print('yes');
  final queryparams={'email':email,'password':password};
  String query=Uri(queryParameters:queryparams).query;
  var url='http://127.0.0.1:8000/api/orglogin';
  final response=await http.post(url,body: queryparams);
  print(response.body);
  return LoginStatus.fromJson(jsonDecode(response.body));
}

class Assignworkstatus{
  String success;

  Assignworkstatus(this.success);

  factory Assignworkstatus.fromJson(Map<String,dynamic> json){
    return Assignworkstatus(json['success']);
  }

}

Future<Assignworkstatus> assignwork(Map<String,dynamic> data)async{
  var url='http://127.0.0.1:8000/api/assignwork';
  final response=await http.post(url,body:data);
  return Assignworkstatus.fromJson(jsonDecode(response.body));

}

class Approveleavestatus{
  String success;

  Approveleavestatus(this.success);

  factory Approveleavestatus.fromJson(Map<String,dynamic>json){
    return Approveleavestatus(json['success']);
  }
}

Future<Approveleavestatus> approveleave(Map<String,dynamic> data)async{
  var url='http://127.0.0.1:8000/api/approveleave';
  var response=await http.post(url,body:data);
  return Approveleavestatus.fromJson(jsonDecode(response.body));
}

class Addempstatus{
  String success;

  Addempstatus(this.success);

  factory Addempstatus.fromJson(Map<String,dynamic>json){
    return Addempstatus(json['success']);
  }
}

Future<Addempstatus> addemp(Map<String,dynamic> data)async{
  var url='http://127.0.0.1:8000/api/addemp';
  var response=await http.post(url,body:data);
  return Addempstatus.fromJson(jsonDecode(response.body));

}

class Getorgleaves{
  Map value;

  Getorgleaves(this.value);

  factory Getorgleaves.fromJson(Map<String,dynamic> json){
    return Getorgleaves(json);
  }
}

Future<Getorgleaves>getorgleaves(Map<String,dynamic> data)async{
  var url='http://127.0.0.1:8000/api/getorgleaves/'+'?'+'email'+'='+data['email'];
  print(data);
  var response=await http.get(url);
  print(response.body);
  return Getorgleaves.fromJson(jsonDecode(response.body));
}
class Getwork{
  Map data;
  Getwork(this.data);

  factory Getwork.fromJson(Map<String,dynamic> json){
    return Getwork(json);
  }
}
Future<Getwork> getwork(Map data)async{
  var url='http://127.0.0.1:8000/api/getworks/'+'?'+'email'+'='+data['email'];
  print(data);
  var response=await http.get(url);
  print(response.body);
  return Getwork.fromJson(jsonDecode(response.body));
}


class EmpLogin{
  Map data;

  EmpLogin(this.data);
  factory EmpLogin.fromJson(Map<String,dynamic> json){
    return EmpLogin(json);
  }
}
Future<EmpLogin>emplogin(Map data)async{
  var url='http://127.0.0.1:8000/api/login/';
  var response=await http.post(url,body:data);
  return EmpLogin.fromJson(jsonDecode(response.body));
}

class ApplyLeave{
  Map data;
  ApplyLeave(this.data);

  factory ApplyLeave.fromJson(Map<String,dynamic> json){
    return ApplyLeave(json);
  }

}
Future<ApplyLeave>applyleave(Map data)async{
  var url='http://127.0.0.1:8000/api/leave/';
  var response=await http.post(url,body:data);
  print(response.body);
  return ApplyLeave(jsonDecode(response.body));
}
class AllLeave{
  Map data;
  AllLeave(this.data);
  factory AllLeave.frimJson(Map<String,dynamic> json){
    return AllLeave(json);
  }
}
Future<AllLeave>allleave(Map data)async{
  var url='http://127.0.0.1:8000/api/getleaves/?'+'email='+data['email'];
  var response=await http.get(url);
  print(response.body);
  return AllLeave(jsonDecode(response.body));
}
class Work{
  Map data;
  Work(this.data);
  factory Work.fromJson(Map<String,dynamic>json){
    return Work(json);
  }
}
Future<Work>works(Map data)async{
  var url='http://127.0.0.1:8000/api/getempworks/?'+'email='+data['email'];
  var response=await http.get(url);
  print(response.body);
  return Work(jsonDecode(response.body));
}

class Completework{
  Map data;
  Completework(this.data);
  factory Completework.fromJson(Map<String,dynamic>json){
    return Completework(json);
  }
}
Future<Completework> completework(Map data)async{
  var url='http://127.0.0.1:8000/api/completework';
  var response=await http.post(url,body: data);
  print(response.body);
  return Completework(jsonDecode(response.body));
}