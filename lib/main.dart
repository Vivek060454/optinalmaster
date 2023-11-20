import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:optionalmaster/screen/Home.dart';
import 'package:optionalmaster/screen/Page.dart';
import 'package:optionalmaster/screen/login.dart';
import 'package:optionalmaster/theme.dart';

void main() async {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        errorColor: Colors.red,
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Mytheme().primary,
          secondary: Mytheme().secondary
        ),
        primaryColor:  Mytheme().primary,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  final uid1 = new FlutterSecureStorage();

  Future<bool> checkLogin() async {
    String? value = await uid1.read(key: "uid");
    if (value == null) {
      return false;
    }
    return true;
  }

  void initState() {
    super.initState();
  if(DateTime.now().month==12){
    Timer(
        const Duration(seconds: 2),
    () =>   Navigator.push(context, MaterialPageRoute(builder: (context)=> Pagei())));
  }
  else{
    Timer(
      const Duration(seconds: 2),
          () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => FutureBuilder(
                future: checkLogin(),
                builder:
                    (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.data == false) {
                    return Login();
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      color: Colors.white,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return Home();
                },
              ))),

    );
  }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 100,
        top: 100,
        right: 100,

      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          image: const DecorationImage(
            image: AssetImage(
                'assets/image.png'),
            // fit: BoxFit.cover,
          )),
    );
  }
}