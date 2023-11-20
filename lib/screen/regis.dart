
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';

import '../Repository/Repostitory.dart';
import '../theme.dart';
import 'Home.dart';
import 'login.dart';


class Regis extends StatefulWidget {
  const Regis({Key? key}) : super(key: key);

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  bool value = false;
  var _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final  fname =  TextEditingController();
  final  lname =  TextEditingController();
  final  emailEController =  TextEditingController();
  final  phoneEController =  TextEditingController();
  final  passwordEController =  TextEditingController();
  final uid1 = new FlutterSecureStorage();
  final LocalStorage userid =  LocalStorage('localstorage_app');

  static const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';


  @override
  Widget build(BuildContext context) {
    final regex = RegExp(pattern);

    final signup = InkWell(
      onTap:  _isLoading ? null :() async {
        if (_formKey.currentState!.validate()) {
         regis(fname.text, lname.text,phoneEController.text,emailEController.text,passwordEController.text);

        }},
      child: Container(

        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Mytheme().primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text( _isLoading ?'Please wait':'SIGNUP',

            style: TextStyle(fontSize: 20,color: Colors.white,letterSpacing: 3.0),
          ),
        ),

      ),
    );
    return Scaffold(
      backgroundColor: Mytheme().primary,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),

              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        autofocus: false,
                        controller: fname,
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          fname.text = value!;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "First Name",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your first name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        autofocus: false,
                        controller: lname,
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          lname.text = value!;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Last Name",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your last name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        autofocus: false,
                        controller: phoneEController,
                        keyboardType: TextInputType.phone,
                        onSaved: (value) {
                          phoneEController.text = value!;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.call),
                            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Phone Number",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your phone number";
                          }
                          if (value.length > 10 || value.length < 10) {
                            return "Enter your valid phone number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        autofocus: false,
                        controller: emailEController,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          emailEController.text = value!;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Email",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your email";
                          }
                          if(!regex.hasMatch(value)){
                            return "Enter your valid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      TextFormField(
                        autofocus: false,
                        obscureText: true,
                        controller: passwordEController,
                        onSaved: (value) {
                          passwordEController.text = value!;
                        },
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.vpn_key),
                            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Password",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      signup,
                      const SizedBox(
                        height: 30,
                      ),

                      //Checkbox
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  regis(fname,lname,phone,email,password) async {
    setState(() => _isLoading = true);
    await Repositor().regis(fname:fname,lname: lname,phone: phone,email: email,password: password ).then((value){
      print(value);
      if(value["response"].toString()=="1"){
        print(value["data"]["user_id"].toString()+"jhsfgbf");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        userid.setItem('userid', value["data"]["user_id"].toString());
        uid1.write(key: 'uid', value: value["data"]["user_id"].toString());
        Fluttertoast.showToast(msg: 'Register Succesfully');
      }
      else{
        setState(() => _isLoading = false);
        Fluttertoast.showToast(msg: "Wrong credential");
      }
    });
// await Repositor().login(email: email, password: password).then((val){
//   Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
// print(val.toString());
// }).catchError(( e) {
//   setState(() => _isLoading = false);
// });
        {
    };
  }


}