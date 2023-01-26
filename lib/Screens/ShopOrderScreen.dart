import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:e_laundry/Constants/constants.dart';
import 'package:e_laundry/Services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShopOrder extends StatefulWidget {
  String laundryService;
  String shopName;
  ShopOrder({required this.laundryService, required this.shopName, Key? key})
      : super(key: key);

  @override
  _ShopOrderState createState() => _ShopOrderState();
}

var now = new DateTime.now();
var nowTime = new DateFormat.jm().format(DateTime.now());
//var formatter = new DateFormat('yMd');
String formattedDate = DateFormat.yMMMMd('en_US').format(now);

double _shirtSliderValue = 0;
double _pantSliderValue = 0;
double _suitSliderValue = 0;
bool confirmed = false;
TextEditingController extraNotes = TextEditingController();
var sameDayDelivery = false;
var twoDayDelivery = true;

class _ShopOrderState extends State<ShopOrder> {
  @override
  Widget build(BuildContext context) {
    formattedDate = DateFormat.yMMMMd('en_US').format(now);
    nowTime = new DateFormat.jm().format(DateTime.now());
    now = new DateTime.now();
    confirmed = false;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
            widget.laundryService,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.normal,
                letterSpacing: 3),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:
              /*Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 52, right: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: scText,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: */
              SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.shopName,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    Text("Shirts ",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: scText)),
                    Image(
                      width: 35,
                      image: AssetImage(
                        'assets/shirt.png',
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("(50 per item)",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: priText)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 5,
                        child: IconButton(
                            color: primary,
                            onPressed: () {
                              setState(() {
                                if (_shirtSliderValue != 0) {
                                  _shirtSliderValue = _shirtSliderValue - 1;
                                }
                              });
                            },
                            icon: Icon(Icons.remove)),
                      ),
                      Text(
                          _shirtSliderValue
                              .toString()
                              .replaceAll(RegExp(r"([.]*0)(?!.*\d)"), ""),
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: scText)),
                      Card(
                        elevation: 5,
                        child: IconButton(
                          color: primary,
                          onPressed: () {
                            setState(() {
                              _shirtSliderValue = _shirtSliderValue + 1;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                          ),
                        ),
                      )
                      /* Container(
                                width: MediaQuery.of(context).size.width / 1.6,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    valueIndicatorShape:
                                        PaddleSliderValueIndicatorShape(),
                                    valueIndicatorColor: Colors.redAccent,
                                    valueIndicatorTextStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: Slider(
                                    value: _shirtSliderValue,
                                    min: 0,
                                    max: 20,
                                    divisions: 20,
                                    activeColor: primary,
                                    label: _shirtSliderValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        _shirtSliderValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ),*/
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    Text("Pants ",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: scText)),
                    Image(
                      width: 35,
                      image: AssetImage(
                        'assets/pant.png',
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("(50 per item)",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: priText)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 5,
                        child: IconButton(
                          color: primary,
                          onPressed: () {
                            setState(() {
                              if (_pantSliderValue != 0) {
                                _pantSliderValue = _pantSliderValue - 1;
                              }
                            });
                          },
                          icon: Icon(Icons.remove),
                        ),
                      ),
                      Text(
                          _pantSliderValue
                              .toString()
                              .replaceAll(RegExp(r"([.]*0)(?!.*\d)"), ""),
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: scText)),
                      Card(
                        elevation: 5,
                        child: IconButton(
                            color: primary,
                            onPressed: () {
                              setState(() {
                                _pantSliderValue = _pantSliderValue + 1;
                              });
                            },
                            icon: Icon(Icons.add)),
                      ),
                      /*Container(
                                width: MediaQuery.of(context).size.width / 1.6,
                                child: 
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    valueIndicatorShape:
                                        PaddleSliderValueIndicatorShape(),
                                    valueIndicatorColor: Colors.redAccent,
                                    valueIndicatorTextStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: Slider(
                                    value: _pantSliderValue,
                                    min: 0,
                                    max: 20,
                                    divisions: 20,
                                    activeColor: primary,
                                    label: _pantSliderValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        _pantSliderValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ),*/
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(width: 70),
                    Text("Suits ",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: scText)),
                    Image(
                      width: 35,
                      image: AssetImage(
                        'assets/suit.png',
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("(150 per item)",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: priText)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 5,
                        child: IconButton(
                            color: primary,
                            onPressed: () {
                              setState(() {
                                if (_suitSliderValue != 0) {
                                  _suitSliderValue = _suitSliderValue - 1;
                                }
                              });
                            },
                            icon: Icon(Icons.remove)),
                      ),
                      Text(
                          _suitSliderValue
                              .toString()
                              .replaceAll(RegExp(r"([.]*0)(?!.*\d)"), ""),
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: scText)),
                      Card(
                        elevation: 5,
                        child: IconButton(
                            color: primary,
                            onPressed: () {
                              setState(() {
                                _suitSliderValue = _suitSliderValue + 1;
                              });
                            },
                            icon: Icon(Icons.add)),
                      )
                      /* Container(
                                width: MediaQuery.of(context).size.width / 1.6,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    valueIndicatorShape:
                                        PaddleSliderValueIndicatorShape(),
                                    valueIndicatorColor: Colors.redAccent,
                                    valueIndicatorTextStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: Slider(
                                    value: _suitSliderValue,
                                    min: 0,
                                    max: 20,
                                    divisions: 20,
                                    activeColor: primary,
                                    label: _suitSliderValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        _suitSliderValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ),*/
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //    padding: EdgeInsets.only(bottom: 15),
                          child: Text(
                            "Pick up :",
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                                color: scText),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          (now.hour + 2).toString() +
                              ":" +
                              now.minute.toString() +
                              " ,",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: priText),
                        ),
                        SizedBox(
                          width: 05,
                        ),
                        Text(
                          formattedDate,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: scText),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          //     padding: EdgeInsets.only(left: 60),
                          child: Text(
                            "Delivery :",
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                                color: scText),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: twoDayDelivery,
                                shape: CircleBorder(),
                                onChanged: (value) {
                                  setState(() {
                                    twoDayDelivery = value!;
                                    if (sameDayDelivery == true) {
                                      sameDayDelivery = false;
                                    }
                                  });
                                },
                                activeColor: primary,
                              ),
                              Text(
                                "2-3 days",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                    color: scText),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: sameDayDelivery,
                              shape: CircleBorder(),
                              onChanged: (value) {
                                setState(() {
                                  sameDayDelivery = value!;
                                  if (twoDayDelivery == true) {
                                    twoDayDelivery = false;
                                  }
                                });
                              },
                              activeColor: primary,
                            ),
                            Text(
                              "Next day",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  color: scText),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Extra Notes ",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: scText)),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 1.6,
                    child: TextField(
                      controller: extraNotes,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: new BorderSide(color: primary!)),
                          hintText: 'Add Notes here'),
                      maxLines: 4,
                    )),
                SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 10,
                  child: ElevatedButton(
                    onPressed: () {
                      int total = _shirtSliderValue.toInt() * 50 +
                          _pantSliderValue.toInt() * 50 +
                          _suitSliderValue.toInt() * 150;
                      //  confirmed = false;
                      if (_shirtSliderValue == 0 &&
                          _pantSliderValue == 0 &&
                          _suitSliderValue == 0) {
                        _showErrorDialog("Please Select atleast One Option");
                      } else {
                        if (twoDayDelivery == false &&
                            sameDayDelivery == false) {
                          _showErrorDialog("Please Select Delivery Option");
                        } else {
                          _showConfirmDialog();
                        }

                        if (confirmed == true) {
                          print(" Confirmed :" + confirmed.toString());
                          AuthService(FirebaseAuth.instance).addOrder(
                              widget.laundryService,
                              FirebaseAuth.instance.currentUser!.uid.toString(),
                              FirebaseAuth.instance.currentUser!.displayName
                                  .toString(),
                              _shirtSliderValue.toInt(),
                              _pantSliderValue.toInt(),
                              _suitSliderValue.toInt(),
                              total,
                              extraNotes.text);
                        }
                      }
                    },
                    child: Container(
                        // color: primary,
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Confirm",
                            style: GoogleFonts.arimo(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Colors.white),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showErrorDialog(String erroeMsg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert !'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(erroeMsg.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            Card(
              color: primary,
              elevation: 8,
              child: TextButton(
                child: const Text(
                  'Ok',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  /* Widget _getTicketReceiptView() {
    return TicketView(
      backgroundPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      backgroundColor: Color(0xFF8F1299),
      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 0),
      drawArc: false,
      triangleAxis: Axis.vertical,
      borderRadius: 6,
      drawDivider: true,
      trianglePos: .5,
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'DRAKE',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Expanded(child: Container()),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Price: ',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text: '\$15.00',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14),
                    Text(
                      'VR Tickets, General Admission',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 14),
                    Text(
                      'Madison Square Garden, NY',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 14),
                    Text(
                      'November 30,2020, 7:00PM',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 14),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Price: ',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: '\$15.00',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Image.asset('assets/qr_placeholder.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }*/

  //Future<void>
  _showConfirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: AlertDialog(
            elevation: 10,
            title: const Text('Confirm Order'),
            content: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Please Confirm Your Order."),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text("Shirts ",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: scText)),
                            Image(
                              width: 35,
                              image: AssetImage(
                                'assets/shirt.png',
                              ),
                            ),
                            Text(" : ",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: scText)),
                          ],
                        ),
                        Text(
                          _shirtSliderValue.toInt().toString(),
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: primary),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text("Pants ",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: scText)),
                            Image(
                              width: 35,
                              image: AssetImage(
                                'assets/pant.png',
                              ),
                            ),
                            Text(" : ",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: scText)),
                          ],
                        ),
                        Text(
                          _pantSliderValue.toInt().toString(),
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: primary),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text("Suits ",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: scText)),
                              Image(
                                width: 35,
                                image: AssetImage(
                                  'assets/suit.png',
                                ),
                              ),
                              Text(" : ",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: scText)),
                            ],
                          ),
                          Text(
                            _suitSliderValue.toInt().toString(),
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: primary),
                          )
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("  Total Cost : ",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: scText)),
                          Text(
                            (_shirtSliderValue * 50 +
                                    _pantSliderValue * 50 +
                                    _suitSliderValue * 150)
                                .toInt()
                                .toString(),
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: primary),
                          )
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Pick Up :",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: scText)),
                          Container(
                            child: Text(
                              (now.hour + 2).toString() +
                                  ":" +
                                  now.minute.toString() +
                                  " , ",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  color: priText),
                            ),
                          ),
                          Container(
                            width: 100,
                            child: Text(
                              formattedDate,
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: scText),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Delivery :",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: scText)),
                        twoDayDelivery == true
                            ? Text("2 day later",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: scText))
                            : Text("Next Day",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: scText)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Card(
                color: Colors.blueGrey,
                elevation: 8,
                child: TextButton(
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    confirmed = false;
                  },
                ),
              ),
              Card(
                color: primary,
                elevation: 8,
                child: TextButton(
                  child: const Text(
                    'Confirm',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {
                    confirmed = true;
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
