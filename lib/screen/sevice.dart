
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';
import 'package:optionalmaster/Model/Homepackages.dart';
import 'package:optionalmaster/Model/ServicesModel.dart';
import 'package:optionalmaster/Model/paymentmodel.dart';
import 'package:optionalmaster/Model/userdetails.dart';
import 'package:optionalmaster/Repository/Repostitory.dart';

import '../theme.dart';


class MySearch extends StatefulWidget {
  final package;
   MySearch({Key? key, this.package, }) : super(key: key);

  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  final LocalStorage userid =  LocalStorage('localstorage_app');
PaymentPackagesModel ?paymentresponce;

  ServicePackagesModel? serviceagesresponce;
  // final LocalStorage tokene = new LocalStorage('localstorage_app');
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  // final token = new FlutterSecureStorage();
  @override
  void initState() {
    searchpackagesdata();
    // TODO: implement initState
    super.initState();
  }

  searchpackagesdata()async{
    serviceagesresponce= await Repositor().servicepackages( widget.package);

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    print("jreng"+serviceagesresponce.toString());
    return Scaffold(
      // backgroundColor:    Mytheme().backgroung,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Service Details"),

      ),





      body: serviceagesresponce==null?Center(child: CircularProgressIndicator(),):serviceagesresponce!.data.length==0?Center(child: Text('No data',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),):Container(
          child:SingleChildScrollView(
            child: Column(
              children: [
                for(var i=0;i<serviceagesresponce!.data.length;i++)...[

                  Padding(
                    padding: const EdgeInsets.only(top: 13,bottom: 13,left: 25,right: 25),
                    child: Container(
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
                            child: Column(
                              children: [
                                Table(
                                  columnWidths: {
                                    0:FlexColumnWidth(4),
                                    1:FlexColumnWidth(2)
                                  },
                                  children: [
                                    TableRow(
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(0.0),
                                                  child: Align(
                                                    alignment: Alignment.topLeft,

                                                    child: RichText(

                                                      overflow: TextOverflow.clip,
                                                      maxLines: 2,
                                                      // The number of font pixels for each logical pixel
                                                      textScaleFactor: 1,
                                                      text: TextSpan(
                                                        text: 'Stop loss : ',
                                                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                                        children:  <TextSpan>[
                                                          TextSpan(
                                                              text: serviceagesresponce!.data[i].stopLoss.toString(), style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 16)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(serviceagesresponce!.data[i].instrument.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                                                Text(serviceagesresponce!.data[i].createdDate.toString(),maxLines:1,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400))
                                              ],
                                            ),
                                          ),
                                          ElevatedButton(onPressed: (){

                                          }, child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Column(
                                              children: [
                                                Text(serviceagesresponce!.data[i].duration.toString(),maxLines:1,textAlign: TextAlign.center,),
                                                Text("Buy",textAlign: TextAlign.center,),

                                              ],
                                            ),
                                          ))
                                        ]
                                    )
                                  ],
                                ),
                                Table(
                                  children: [
                                    TableRow(
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: Color.fromRGBO(240, 240, 240, 1)
                                              ),child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text('Target 1',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                                                  Text(serviceagesresponce!.data[i].target1.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),)
                                                ],
                                              ),
                                            ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color:Color.fromRGBO(240, 240, 240, 1)
                                              ),child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text('Target 2',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                                                  Text(serviceagesresponce!.data[i].target2.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),)
                                                ],
                                              ),
                                            ),
                                            ),
                                          )
                                        ]
                                    )
                                  ],
                                )
                              ],
                            )
                        )
                    ),
                  )
                ],

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
