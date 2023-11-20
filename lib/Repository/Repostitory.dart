
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Model/Homepackages.dart';
import '../Model/Performancemodel.dart';
import '../Model/ServicesModel.dart';
import '../Model/login_model.dart';
import '../Model/paymentmodel.dart';
import '../Model/userdetails.dart';
import '../appconfig.dart';


class Repositor{

  // final LocalStorage tokene = new LocalStorage('localstorage_app');


 login({ required  email,required String password}) async{
    final url=Uri.parse('${AppConfig.BASE_URL}/login_api');

    final data={
      'email':email,
      'password':password
    };
    final responce=await http.post(url,body:data);
    // if(responce.body['re'])
    return jsonDecode(responce.body);
    // return loginmodelFromJson(responce.body);

  }
 regis({   fname,  lname,phone,email,password}) async{
   final url=Uri.parse('${AppConfig.BASE_URL}/register_api');

   final data={
     'fname':fname,
     'lname':lname,
     'mobile':phone,
     'email':email,
     'password':password,
     "company_id":2.toString(),
     "role_id":3.toString()
   };
   final responce=await http.post(url,body:data);
   // if(responce.body['re'])
   return jsonDecode(responce.body);
   // return loginmodelFromJson(responce.body);

 }
 packages({   companyid,serviceid,packagesid,userid,transactionid,amount}) async{
   final url=Uri.parse('${AppConfig.BASE_URL}/add_api/tbl_payments');

   final data={
     'company_id':2.toString(),
     // 'service_id':serviceid,
     'package_id':packagesid.toString(),
     'user_id':userid.toString(),
     'transaction_id':transactionid.toString(),
     "amount":amount.toString(),
     "pay_date":DateTime.now().toString(),
     "status":1.toString(),
   };
   final responce=await http.post(url,body:data);
   // if(responce.body['re'])
   return jsonDecode(responce.body);
   // return loginmodelFromJson(responce.body);

 }
 Future<Userdetailmodel>Userdetails({ required  id}) async{
   final url=Uri.parse('${AppConfig.BASE_URL}/readwhere_api/tbl_users/user_id/$id');


   final responce=await http.get(url);
   // if(responce.body['re'])
   print('usehgsdhbf'+responce.body.toString());
   return userdetailmodelFromJson(responce.body);
   // return loginmodelFromJson(responce.body);

 }

EditUserdetails({ required  id,aadhar,pancard}) async{
   final url=Uri.parse('${AppConfig.BASE_URL}/update_api/tbl_users/user_id/$id');
   final data={
     'adhar':aadhar,
     'pan':pancard
   };
   final responce=await http.post(url,body: data);
   // if(responce.body['re'])
   print('usehgsdhbf'+responce.body.toString());
   return jsonDecode(responce.body);
   // return loginmodelFromJson(responce.body);

 }

 PasswordEditUserdetails({ required  id,oldpassword,newpassowrd}) async{
   final url=Uri.parse('${AppConfig.BASE_URL}/update_api/tbl_users/user_id/$id');
   final data={
     // 'oldpassword':oldpassword,
     'password':newpassowrd
   };
   final responce=await http.post(url,body: data);
   // if(responce.body['re'])
   print('usehgsdhbf'+responce.body.toString());
   return jsonDecode(responce.body);
   // return loginmodelFromJson(responce.body);

 }


 Future<HomePackagesModel>homepackages() async{
   final url=Uri.parse('${AppConfig.BASE_URL}/read_api/tbl_packages');


   final responce=await http.get(url);
   // if(responce.body['re'])
   print('hosehgsdhbf'+responce.body.toString());
   return homePackagesModelFromJson(responce.body);
   // return loginmodelFromJson(responce.body);

 }
 Future<ServicePackagesModel>servicepackages(id) async{
   final url=Uri.parse('${AppConfig.BASE_URL}/read_api/tbl_servicedetail/package_id/$id');


   final responce=await http.get(url);
   // if(responce.body['re'])
   print('hosehgsdhbf'+responce.body.toString());
   return servicePackagesModelFromJson(responce.body);
   // return loginmodelFromJson(responce.body);

 }
 Future<PaymentPackagesModel>paymentdetails(id) async{
   final url=Uri.parse('${AppConfig.BASE_URL}/readwhere_api/tbl_payments/user_id/$id');

print(url);
   final responce=await http.get(url);
   // if(responce.body['re'])
   print('hosehgsdhbf'+responce.body.toString());
   return paymentPackagesModelFromJson(responce.body);
   // return loginmodelFromJson(responce.body);

 }
 Future<PerformancePackagesModel>performancepackages(id) async{
   final url=Uri.parse('${AppConfig.BASE_URL}/read_api/tbl_performance/package_id/$id');
print(url);
   final responce=await http.get(url);
   // if(responce.body['re'])
   print('hosehgsdhbf'+responce.body.toString());
   return performancePackagesModelFromJson(responce.body);
   // return loginmodelFromJson(responce.body);

 }

}