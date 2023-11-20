
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';
import 'package:optionalmaster/screen/Home.dart';
import 'package:optionalmaster/screen/regis.dart';

import '../Model/userdetails.dart';
import '../Repository/Repostitory.dart';
import '../theme.dart';



class EditProfile extends StatefulWidget {
  final data;
   EditProfile({Key? key,this.data}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Userdetailmodel? userresponce;
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  final  fname =  TextEditingController();
  final  lname =  TextEditingController();
  final  emailController =  TextEditingController();
  final  phone =  TextEditingController();
  final  adhardcard =  TextEditingController();
  final  pancard =  TextEditingController();
  final uid1 = new FlutterSecureStorage();
  final LocalStorage userid =  LocalStorage('localstorage_app');

  // final LocalStorage tokene = new LocalStorage('localstorage_app');
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  // final token = new FlutterSecureStorage();
  @override
  void initState() {
    Userdata();
    dataset();
    // TODO: implement initState
    super.initState();
  }

  Userdata()async{
    print("iejg");
    userresponce= await Repositor().Userdetails(id: 13);
    setState(() {});
    dataset();
  }
  dataset(){
     // print("sfgse"+userresponce!.data[0].adhar.toString());
    pancard.text=widget.data.pan;
  adhardcard.text=widget.data.adhar;
  setState(() {

  });

}




  @override
  Widget build(BuildContext context) {










    return userresponce==null?Center(child: CircularProgressIndicator(),):Center(
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
                    readOnly: true,
                    autofocus: false,
                    // controller: fname,
                    initialValue: userresponce!.data[0].fname.toString(),
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
                    readOnly: true,
                    autofocus: false,
                    // controller: lname,
                    initialValue: userresponce!.data[0].lname.toString(),
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
                    readOnly: true,
                    autofocus: false,
                    // controller: phone,
                    initialValue: userresponce!.data[0].mobile.toString(),
                    keyboardType: TextInputType.phone,
                    onSaved: (value) {
                      phone.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.call),
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Phone Number",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    readOnly: true,
                    autofocus: false,
                    initialValue: userresponce!.data[0].email.toString(),
                    // controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      emailController.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Email",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    autofocus: false,
                    controller: adhardcard,
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      adhardcard.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.credit_card_rounded),
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Aadhar Card",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: pancard,
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      pancard.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.credit_card),
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Pan card",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {

                      return null;
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

                        edit(
                          pancard.text,
                           adhardcard.text,
                        );



                    },
                    child: Container(

                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Mytheme().primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text( _isLoading ?'Please wait':'Save',

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
    );
  }

  edit(String pancard, String aadhardcard) async {
    setState(() => _isLoading = true);
    await Repositor().EditUserdetails(id: int.parse(userid.getItem( 'userid')),aadhar: aadhardcard.toString(),pancard:pancard.toString() ).then((value){
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