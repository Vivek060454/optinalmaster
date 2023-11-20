
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';
import 'package:optionalmaster/screen/Home.dart';
import 'package:optionalmaster/screen/regis.dart';

import '../Repository/Repostitory.dart';
import '../theme.dart';



class ResetProfile extends StatefulWidget {
  const ResetProfile({Key? key}) : super(key: key);

  @override
  State<ResetProfile> createState() => _ResetProfileState();
}

class _ResetProfileState extends State<ResetProfile> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  final  oldpasssword =  TextEditingController();
  final  newpassword =  TextEditingController();
  final LocalStorage userid =  LocalStorage('localstorage_app');

  final uid1 = new FlutterSecureStorage();




  @override
  Widget build(BuildContext context) {










    return Form(
      key: _formKey,
      child: Center(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      autofocus: false,
                      obscureText: true,
                      controller: oldpasssword,
                      onSaved: (value) {
                        oldpasssword.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "Old password",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        // RegExp regex= new RegExp(r'^.{6,}$');
                        print(value);
                        if (value!.isEmpty) {
                          return (" Please enter password");
                        }

                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autofocus: false,
                      obscureText: true,
                      controller: newpassword,
                      onSaved: (value) {
                        newpassword.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "New password",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        // RegExp regex= new RegExp(r'^.{6,}$');
                        print(value);
                        if (value!.isEmpty) {
                          return (" Please enter new password");
                        }

                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),



                    SizedBox(
                      height: 20,
                    ),

                    InkWell(
                      onTap:  _isLoading ? null :() async {
                        print('fng');
                        if (_formKey.currentState!.validate()) {

                          edit(
                            oldpasssword.text,
                            newpassword.text,
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
                          child: Text( _isLoading ?'Please wait':'Reset',

                            style: TextStyle(fontSize: 20,color: Colors.white,letterSpacing: 3.0),
                          ),
                        ),

                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  edit(String oldpasswprd, String newpassword) async {
    setState(() => _isLoading = true);
    await Repositor().PasswordEditUserdetails(id: int.parse(userid.getItem( 'userid')),oldpassword: oldpasswprd.toString(),newpassowrd:newpassword.toString() ).then((value){
      print(value);
      if(value["response"].toString()=="1"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        Fluttertoast.showToast(msg: 'Updated Succesfully');
      }
      else{
        setState(() => _isLoading = false);
        Fluttertoast.showToast(msg: "Wrong data");
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