
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';
import 'package:optionalmaster/screen/Home.dart';
import 'package:optionalmaster/screen/regis.dart';

import '../Repository/Repostitory.dart';
import '../theme.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  var breed_type=null;
  final  emailController =  TextEditingController();
  final  nameController =  TextEditingController();
  final  passwordController =  TextEditingController();
  final uid1 = new FlutterSecureStorage();
  final LocalStorage userid =  LocalStorage('localstorage_app');





  @override
  Widget build(BuildContext context) {










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
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      TextFormField(
                        autofocus: false,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          emailController.text = value!;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Email",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        validator: (emailController) {
                          if (!emailController.toString().contains("@")) {
                            return "Please enter the valid email";
                          }
                          if (emailController!.isEmpty) {
                            return ("Please enter the value");
                          }

                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        autofocus: false,
                        obscureText: true,
                        controller: passwordController,
                        onSaved: (value) {
                          passwordController.text = value!;
                        },
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Password",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          // RegExp regex= new RegExp(r'^.{6,}$');
                          print(value);
                          if (value!.isEmpty) {
                            return (" Please enter password");
                          }

                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        onTap:  _isLoading ? null :() async {
                          print('fng');
                          if (_formKey.currentState!.validate()) {

                            login(
                              emailController.text,
                              passwordController.text,
                            );


                          }
                        },
                        child: Container(

                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Mytheme().primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text( _isLoading ?'Please wait':'LOGIN',

                              style: TextStyle(fontSize: 20,color: Colors.white,letterSpacing: 3.0),
                            ),
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Dont have a account?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Regis()));
                            },
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Mytheme().primary),
                            ),
                          ),
                        ],
                      )
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

   login(String email, String password) async {
    setState(() => _isLoading = true);
    await Repositor().login(email: email, password: password).then((value){
      print(value);
      if(value["response"].toString()=="1"){
        print(value["data"]["user_id"].toString()+"jhsfgbf");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        userid.setItem('userid', value["data"]["user_id"].toString());
        uid1.write(key: 'uid', value: value["data"]["user_id"].toString());
        Fluttertoast.showToast(msg: 'Login Succesfully');
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