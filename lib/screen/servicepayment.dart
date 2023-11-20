import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:optionalmaster/screen/sevice.dart';

import '../Model/ServicesModel.dart';
import '../Model/paymentmodel.dart';
import '../Repository/Repostitory.dart';

class Servicepayment extends StatefulWidget {
  const Servicepayment({Key? key}) : super(key: key);

  @override
  State<Servicepayment> createState() => _ServicepaymentState();
}

class _ServicepaymentState extends State<Servicepayment> {
  PaymentPackagesModel ?paymentresponce;

  final LocalStorage userid =  LocalStorage('localstorage_app');

  @override
  void initState() {
    paymentpackagesdata();
    // TODO: implement initState
    super.initState();
  }

  paymentpackagesdata()async{
    paymentresponce= await Repositor().paymentdetails( int.parse(userid.getItem( 'userid')));

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Research"),
      ),
      body:    paymentresponce==null?Center(child: CircularProgressIndicator()):  Container(
    child:SingleChildScrollView(
    child: Column(
    children: [
    for(var i=0;i<paymentresponce!.data.length;i++)...[
    Padding(
    padding: const EdgeInsets.only(top: 13,bottom: 13,left: 25,right: 25),
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MySearch(package:paymentresponce!.data[i]!.packageId)));
      },
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
      0:FlexColumnWidth(6),
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
      text: paymentresponce!.data[i]!.packageName.toString(), style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 16)),
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
      text: paymentresponce!.data[i]!.price.toString(), style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 16)),
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
      text: paymentresponce!.data[i]!.duration.toString(), style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 16)),
      ],
      ),
      ),
      ),
      ),
      ],
      ),

      Container()

      ]
      )
      ],
      ),
      )
      ),
    ),
    ),
    ],

    SizedBox(
    height: 20,
    ),

    ],
    ),
    ),
    ));
  }
}
