
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';
import 'package:optionalmaster/Model/Homepackages.dart';
import 'package:optionalmaster/Model/userdetails.dart';
import 'package:optionalmaster/Repository/Repostitory.dart';
import 'package:optionalmaster/screen/performance.dart';
import 'package:optionalmaster/screen/sevice.dart';

import '../theme.dart';
import 'Editprofile.dart';
import 'ResetProfile.dart';


class Profile extends StatefulWidget {
  final data;
   Profile({Key? key,  this.data}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
   Userdetailmodel? userresponce;
   HomePackagesModel? homepackagesresponce;
   final LocalStorage userid =  LocalStorage('localstorage_app');


   // final LocalStorage tokene = new LocalStorage('localstorage_app');
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  // final token = new FlutterSecureStorage();
@override
  void initState() {
  Userdata();
  homepackagesdata();
  getdata();
    // TODO: implement initState
    super.initState();
  }
  getdata(){
  Userdata();
  homepackagesdata();

  }

  Userdata()async{
  print("iejg");
  userresponce= await Repositor().Userdetails(id: int.parse(userid.getItem( 'userid')));
  setState(() {});
  }
  homepackagesdata()async{
     homepackagesresponce= await Repositor().homepackages();

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
  print("jreng"+userresponce.toString());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor:    Mytheme().backgroung,
        appBar: AppBar(
          // backgroundColor: Colors.white,
          elevation: 0,
title: Text("Profile"),
bottom: TabBar(
  tabs: [
Tab(
  text:'Edit Profile',
),
    Tab(
      text:'Reset Profile',
    )
  ],
),
          ),





        body:TabBarView(
          children: [
            EditProfile(data:widget.data),
            ResetProfile()
          ],
        )
      ),
    );
  }
}
