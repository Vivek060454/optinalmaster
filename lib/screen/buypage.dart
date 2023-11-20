import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';
import 'package:optionalmaster/Model/Homepackages.dart';
import 'package:optionalmaster/screen/servicepayment.dart';
import 'package:optionalmaster/screen/sevice.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../Repository/Repostitory.dart';
import '../theme.dart';

class BuyPage extends StatefulWidget {
  final data;
   BuyPage( {Key? key, this.data}) : super(key: key);

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  int  dicount=0;
  final List discountcount=[
   "1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30",
    "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"
  ];
  var _razorpay = Razorpay();

  final LocalStorage userid =  LocalStorage('localstorage_app');
  final  coupon =  TextEditingController();

  var price;
  var dicounttype;
  @override
  void initState() {
    setdata();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // TODO: implement initState
    super.initState();
  }
  setdata(){

    setState(() {
      price=widget.data.price.toString();
      dicounttype=widget.data.duration.toString();
      print(widget.data.duration.toString());
      print(dicounttype.toString()+"jghf");
    });
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds\
    Fluttertoast.showToast(msg: 'payment succeeds');
    await Repositor().packages(companyid: widget.data.companyId.toString(),serviceid: widget.data.serviceId.toString(),packagesid: widget.data.packageId.toString(),userid: int.parse(userid.getItem( 'userid')),transactionid: response.paymentId.toString(),amount: price.toString()).then((value){
      print("sethsth"+value.toString());
      if(value["response"].toString()=="1"){
        // print(value["data"]["user_id"].toString()+"jhsfgbf");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Servicepayment()));

        Fluttertoast.showToast(msg: 'Done');
      }
      else{

        Fluttertoast.showToast(msg: "Something went wrong");
      }
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print(response.message);
    Fluttertoast.showToast(msg: 'payment fails'+response.message.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    // Fluttertoast.showToast(msg: 'payment succeeds');
  }
  @override
  Widget build(BuildContext context) {
    price==widget.data.price.toString();
    dicounttype==widget.data.duration.toString();
    print(widget.data.duration.toString());
    print(dicounttype.toString()+"jghf");
    return Scaffold(
      appBar: AppBar(
        title: Text('Pricing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    text: 'Pakage name : ',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                    children:  <TextSpan>[
                      TextSpan(
                          text:widget.data.packageName.toString(), style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 16)),
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
                          text:widget.data.duration.toString(), style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(

              padding: const EdgeInsets.all(8.0),
              child: Container(
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     border: Border.all(color: Colors.black)
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text("Price:",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),
                  )),
            ),
            Table(
              children: [
                TableRow(
                  children: [
                    Padding(

                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(price.toString()==null?widget.data.price.toString():price.toString(),style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dicount==0?"":dicount.toString()+ " %",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),
                      ),
                    ),

                  ]
                )
              ],
            ),

            // Padding(
            //
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     // decoration: BoxDecoration(
            //     //     borderRadius: BorderRadius.circular(10),
            //     //     border: Border.all(color: Colors.black)
            //     // ),
            //       child: Padding(
            //         padding: const EdgeInsets.all(0.0),
            //         child: Text("Select day:",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),
            //       )),
            // ),
            SizedBox(height: 10,),
            Table(
                columnWidths: {
                  0:FlexColumnWidth(4),
                  1:FlexColumnWidth(2)
                },
              children: [
                TableRow(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                      ),
                      child: TextFormField(
                        autofocus: false,
                        controller: coupon,
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          coupon.text = value!;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            // prefixIcon: const Icon(Icons.person),
                            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Coupon",
                            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: (){

                        if(widget.data.couponCode.toString()==coupon.text){
                          // print(widget.data.discount+"dfgs");
                          // print(widget.data.discount);
                          dicount=widget.data.discount ==""?0:widget.data.discount;

                          price= int.parse(widget.data.price) *( (100- dicount)/100);
                          print(price.toString()+"jdhg".toString());
                          setState(() {

                          });
                        }
                        else{
                          Fluttertoast.showToast(msg: "Wrong coupon code");
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                          color: Mytheme().primary
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(child: Text('Apply',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500
                          ),)),
                        ),
                      ),
                    )
                  ]
                )
              ],
            ),

        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10),
        //         border: Border.all(color: Colors.black)
        //     ),
        //     child: DropdownButtonHideUnderline(
        //       child: DropdownButton(
        //
        //         isExpanded: true,
        //         hint: Padding(
        //           padding: const EdgeInsets.only(top: 0,bottom: 0,right: 16,left: 0),
        //
        //           child: Padding(
        //             padding: const EdgeInsets.only(top: 0,bottom: 0,right: 0,left: 10),
        //             child: Row(
        //               children: [
        //                 Text('',
        //                   style:  TextStyle(color:Colors.black),),
        //               ],
        //             ),
        //           ),
        //         ),
        //         value: dicounttype,
        //         items: discountcount
        //             .map((ite) => DropdownMenuItem(
        //           value: ite,
        //           child: Padding(
        //             padding: const EdgeInsets.only(top: 0,bottom: 0,right: 13,left: 10),
        //             child: Row(
        //               children: [
        //                 // Icon(Icons.pets,color: Colors.grey,),
        //                 Text(' '+ite,
        //                   style:  TextStyle(color:Colors.black),),
        //               ],
        //             ),
        //           ),
        //         ))
        //             .toList(),
        //         onChanged: (items) =>
        //
        //             setState(() {
        //               dicounttype = items;
        //               print(int.parse(widget.data.price));
        //               print(int.parse(widget.data.duration));
        //               print(int.parse(dicounttype));
        //                price= (int.parse(widget.data.price)/ int.parse(widget.data.duration))*int.parse(dicounttype);
        //               print("fghdfh"+price.toString());
        //             }),
        //       ),
        //     ),
        //   ),
        // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  var finalprice=double.parse(price.toString());;
                  // if(price is int){
                  //
                  // }
                  // else{
                  //
                  //   finalprice=int.parse(price.toStringAsFixed(0));
                  // }

print("jbhj"+finalprice.toString());
                  var options = {
                    'key': 'rzp_test_Bb1olywoVX7pnr',
                    'amount': finalprice*100, //in the smallest currency sub-unit.
                    'name': 'Options Master',
                    'description': 'Optional Master',
                    'timeout': 250, // in seconds
                    'prefill': {
                      'contact': '',
                      'email': ''
                    }
                  };
                  try{
                    _razorpay.open(options);
                  }
                  catch(e){
                    print("kjbihbbuhb"+e.toString());
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
                    child: Text('PAY',

                      style: TextStyle(fontSize: 20,color: Colors.white,letterSpacing: 3.0),
                    ),
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    // TODO: implement dispose
    super.dispose();
  }
}
