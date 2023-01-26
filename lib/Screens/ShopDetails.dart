import 'package:e_laundry/Constants/constants.dart';
import 'package:e_laundry/Screens/ShopOrderScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShopDetails extends StatefulWidget {
  final String shopNameDetails;
  ShopDetails({
    Key? key,
    required this.shopNameDetails,
  }) : super(key: key);

  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
              padding:
                  EdgeInsets.only(top: 15, left: 10, right: 50, bottom: 600),
              child: Icon(
                Icons.badge_outlined,
                color: primary,
                size: 50,
              )),
          Container(
            padding: EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Welcome \n ${FirebaseAuth.instance.currentUser!.displayName},",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 3),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Card(
                          elevation: 10,
                          color: Colors.cyan[50],
                          child: Container(
                            padding: EdgeInsets.all(3),
                            child: Image(
                              width: 65,
                              image: AssetImage(
                                'assets/user.png',
                              ),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 100,
                    width: 190,
                    child: Text(
                        "Choose the type of Service, which you are interested in from the set below",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            wordSpacing: 5)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Laundry Service",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShopOrder(
                                          shopName: widget.shopNameDetails,
                                          laundryService: "Iron Only")));
                            },
                            child: Card(
                              shadowColor: Colors.black87,
                              elevation: 10,
                              child: Container(
                                height: 135,
                                width: 100,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Icon(
                                        Icons.iron_outlined,
                                        size: 60,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text("Iron Only",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                            wordSpacing: 4)),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text("1 day",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w200,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShopOrder(
                                          shopName: widget.shopNameDetails,
                                          laundryService: "Wash , Iron")));
                            },
                            child: Card(
                              shadowColor: Colors.black87,
                              elevation: 10,
                              child: Container(
                                height: 135,
                                width: 100,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Icon(
                                        Icons.local_laundry_service,
                                        size: 60,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Wash, Iron ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                            wordSpacing: 4)),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text("3 day",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w200,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShopOrder(
                                          shopName: widget.shopNameDetails,
                                          laundryService: "Dry Clean")));
                            },
                            child: Card(
                              shadowColor: Colors.black87,
                              elevation: 10,
                              child: Container(
                                height: 135,
                                width: 100,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Icon(
                                        Icons.dry_cleaning_outlined,
                                        size: 60,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text("Dry Clean",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                            wordSpacing: 4)),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text("2 day",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w200,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShopOrder(
                                            laundryService: "Dry Wash",
                                            shopName: widget.shopNameDetails,
                                          )));
                            },
                            child: Card(
                              shadowColor: Colors.black87,
                              elevation: 10,
                              child: Container(
                                height: 135,
                                width: 100,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Icon(
                                        Icons.dry_cleaning_sharp,
                                        size: 60,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Dry Wash ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                            wordSpacing: 4)),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text("4 day",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w200,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 120),
                    child: Card(
                      color: primary,
                      child: Container(
                        padding: EdgeInsets.only(left: 25),
                        width: 100,
                        child: TextButton(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Other",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                  Text("Add",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10))
                                ],
                              )
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
