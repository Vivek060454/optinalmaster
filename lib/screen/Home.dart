
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';
import 'package:optionalmaster/Model/Homepackages.dart';
import 'package:optionalmaster/Model/userdetails.dart';
import 'package:optionalmaster/Repository/Repostitory.dart';
import 'package:optionalmaster/screen/buypage.dart';
import 'package:optionalmaster/screen/performance.dart';
import 'package:optionalmaster/screen/performancepayment.dart';
import 'package:optionalmaster/screen/profile.dart';
import 'package:optionalmaster/screen/servicepayment.dart';
import 'package:optionalmaster/screen/sevice.dart';

import '../Model/ServicesModel.dart';
import '../Model/paymentmodel.dart';
import '../theme.dart';
import 'login.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Userdetailmodel? userresponce;
   HomePackagesModel? homepackagesresponce;
   final LocalStorage userid =  LocalStorage('localstorage_app');
   final  datae =  TextEditingController();
   PaymentPackagesModel ?paymentresponce;
   final uid1 = new FlutterSecureStorage();
   ServicePackagesModel? serviceagesresponce;




   // final LocalStorage tokene = new LocalStorage('localstorage_app');
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  // final token = new FlutterSecureStorage();
@override
  void initState() {
  Timer(
      const Duration(seconds: 2),
          () =>   getdata());
  // searchpackagesdata();
  // homepackagesdata();
  getdata();
  // Userdata();
    // TODO: implement initState
    super.initState();
  }
  getdata(){
    paymentpackagesdata();
  Userdata();
  searchpackagesdata();
  homepackagesdata();
print(userid.getItem( 'userid').toString()+"hjsgdfhd");
  }
   paymentpackagesdata()async{
     paymentresponce= await Repositor().paymentdetails( int.parse(userid.getItem( 'userid')));

     setState(() {

     });
   }
   searchpackagesdata()async{
     serviceagesresponce= await Repositor().servicepackages( int.parse(userid.getItem( 'userid')));
print("hjdhbg"+serviceagesresponce.toString());
     setState(() {});
   }
  Userdata()async{
  print("iejg");
  userresponce= await Repositor().Userdetails(id: int.parse(userid.getItem( 'userid')));
  setState(() {});
  }
  homepackagesdata()async{
     homepackagesresponce= await Repositor().homepackages();
     print("hjdhbg"+serviceagesresponce.toString());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
  print("jreng"+userresponce.toString());
    return Scaffold(
      // backgroundColor:    Mytheme().backgroung,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
title: Text("Home"),

        ),


      drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),

            ),
            child: ListView(
              //Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[

              userresponce==null?SizedBox(
              height: 190,
              child:UserAccountsDrawerHeader(
                accountEmail:Text('Loading..',maxLines:1,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                accountName: Text('',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child:Text('Es'.toString()[0].toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize:25,color: Color.fromRGBO(220, 95, 0, 1)))

                ),
              ),



            ):  SizedBox(
                  height: 190,
                  child:UserAccountsDrawerHeader(
                    accountEmail:Text(userresponce!.data[0].fname.toString()+' '+userresponce!.data[0].lname.toString(),maxLines:1,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                     accountName: Text('',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child:Text(userresponce!.data[0].fname.toString()[0].toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize:25,color: Color.fromRGBO(220, 95, 0, 1)))

                    ),
                  ),



                ),
                // SizedBox(
                //   height: 20,
                // ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: SvgPicture.asset(
                //       width : MediaQuery. of(context). size. width -150,
                //       "assets/Logo.svg",
                //       // semanticsLabel: 'Acme Logo'
                //     ),
                //   ),
                // ),


                ListTile(

                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("Home",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>Home()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),




                Divider(
                  height: 0,
                  color: Colors.grey,
                ),
                ListTile(

                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("My Research",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color.fromRGBO(11, 37, 69, 1)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>Servicepayment()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),


                Divider(
                  height: 0,
                  color: Colors.grey,
                ),
                ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("My Performance",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color.fromRGBO(11, 37, 69, 1)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>Performancepayment()));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),


                Divider(
                  height: 0,
                  color: Colors.grey,
                ),
                ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("Profile",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color.fromRGBO(11, 37, 69, 1)),),
                  onTap: ()  async {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>Profile(data:userresponce!.data[0])));
                    //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),


                Divider(
                  height: 0,
                  color: Colors.grey,
                ),

                ListTile(
                  // leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                  title:  Text("Logout",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color.fromRGBO(11, 37, 69, 1)),),
                  onTap: ()  async {
                    // Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Expanded(
                          child: AlertDialog(
                            title: Text('Logout'),
                            content: Text('Are you sure?'),
                            actions: [
ElevatedButton(onPressed: (){
  Navigator.pop(context);
}, child: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text('CANCEL'),
)),
                              ElevatedButton(onPressed: () async {
    await uid1.delete(key: 'uid');
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return Login();
    }), (route) => false);
                              }, child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:   Text('LOGOUT'),
                              ))
                            ],
                          ),
                        );
                      },
                    ); //  Navigator.popAndPushNamed(context, 'login');
                  },
                ),


                Divider(
                  height: 0,
                  color: Colors.grey,
                ),

              ],
            ),
          )
      ),


      body:paymentresponce==null?Center(child: CircularProgressIndicator()):
      homepackagesresponce==null?Center(child: CircularProgressIndicator()):  Container(
          child:SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                itemCount: homepackagesresponce!.data.length,
                itemBuilder: (context,i){
                    var vaa;
                    paymentresponce!.data.forEach((element) {
                      vaa=element.packageId;
                    });
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 13,bottom: 13,left: 25,right: 25),
                        child: Container(
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(20),
                          //   border: Border.all(color: Colors.black)
                          // ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:  BorderRadius.circular(13),
                              border: Border.all(color: Colors.grey,),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                ),
                                //       )
                              ],

                            ),

                            child:Padding(

                              padding: const EdgeInsets.all(8.0),
                              child: Table(
                                columnWidths: {
                                  0:FlexColumnWidth(4),
                                  1:FlexColumnWidth(2)
                                },
                                children: [
                                  TableRow(
                                      children: [
                                        Column(

                                          children: [

                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,

                                                child: RichText(

                                                  overflow: TextOverflow.clip,
                                                  maxLines: 2,
                                                  // The number of font pixels for each logical pixel
                                                  textScaleFactor: 1,
                                                  text: TextSpan(
                                                    text: 'Package Name : ',
                                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                                    children:  <TextSpan>[
                                                      TextSpan(
                                                          text: homepackagesresponce!.data[i]!.packageName.toString(), style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 16)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: RichText(
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 1,
                                                  // The number of font pixels for each logical pixel
                                                  textScaleFactor: 1,
                                                  text: TextSpan(
                                                    text: 'Price : ',
                                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                                    children:  <TextSpan>[
                                                      TextSpan(
                                                          text: homepackagesresponce!.data[i]!.price.toString(), style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 16)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,

                                                child: RichText(

                                                  overflow: TextOverflow.clip,
                                                  maxLines: 1,
                                                  // The number of font pixels for each logical pixel
                                                  textScaleFactor: 1,
                                                  text: TextSpan(
                                                    text: 'Duration : ',
                                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                                    children:  <TextSpan>[
                                                      TextSpan(
                                                          text: homepackagesresponce!.data[i]!.duration.toString()+" Days", style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 16)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        vaa ==homepackagesresponce!.data[i]!.packageId?Container():    Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 25),
                                            child: ElevatedButton(onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyPage( data:homepackagesresponce!.data[i])));
//                                           showDialog(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               // final List varii=[1,2,3,4,5];
//                                               var price=homepackagesresponce!.data[i]!.price;
//                                              var initialval =homepackagesresponce!.data[i]!.duration??'';
//                                               datae.text==initialval.toString()??'';
//                                               return Expanded(
//                                                 child: AlertDialog(
//                                                   content:Container(
//                                                     child: Column(
//                                                       children: [
//                                                         Text(price.toString()),
//                                                         Text(datae.text),
//
//                                                         TextFormField(
//                                                           autofocus: false,
//                                                           controller: datae,
//                                                           keyboardType: TextInputType.number,
//                                                           onChanged: (value) {
//
//                                                             datae.text = value!;
// setState(() {
//   price=     ((double.parse(price)/int.parse(initialval))*int.parse( datae.text )) .toString() ;
//   print(price);
//
// });
//                                                           },
//                                                           textInputAction: TextInputAction.next,
//                                                           decoration: InputDecoration(
//                                                               // prefixIcon: Icon(Icons.email),
//                                                               contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//                                                               hintText: "data",
//                                                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
//                                                           validator: (datae) {
//
//                                                             if (datae!.isEmpty) {
//                                                               return ("Please enter the value");
//                                                             }
//
//                                                           },
//                                                         ),
// Text(price)
//                                                       ],
//                                                     ),
//                                                   )
//
//                                                 ),
//                                               );
//                                             },
//                                           );
                                            }, child: Text('Buy')),
                                          ),
                                        ),
                                        // for(var  j=0;j<paymentresponce!.data.length;j++)...[
                                        //   Text( paymentresponce!.data[j].packageId),
                                        //   Text( homepackagesresponce!.data[i]!.packageId),
                                        //   paymentresponce!.data[j].packageId==homepackagesresponce!.data[i]!.packageId?
                                        //  Container():
                                        //
                                        // ]

                                      ]
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  );
          }),

                SizedBox(
                  height: 20,
                ),

              ],
            ),
          )
      ),
    );
  }
}
