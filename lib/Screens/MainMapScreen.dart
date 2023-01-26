import 'dart:ui';

import 'package:e_laundry/Constants/constants.dart';
import 'package:e_laundry/Models/shopDetailsList.dart';
import 'package:e_laundry/Screens/ShopRatingCard.dart';
import 'package:e_laundry/Services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MainMap extends StatefulWidget {
  MainMap({Key? key}) : super(key: key);

  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          'E-Laundry',
          style:
              TextStyle(color: Colors.white, letterSpacing: 3, wordSpacing: 4),
        ),
        actions: [
          IconButton(
              onPressed: () {
                AuthService(FirebaseAuth.instance).signOut();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          children: [
            /* FlutterMap(
              options: MapOptions(
                zoom: 15,
                center: LatLng(33.684422, 73.047882),
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/copyali/ckrpzjqn40cvd17l5e0hi5e8a/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiY29weWFsaSIsImEiOiJja3JuNnhnbTE4MGh4MnZvOHlsZ2IxZm96In0.AcMMGPhLkawMBhBYr1f5hA",
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1IjoiY29weWFsaSIsImEiOiJja3JuNnhnbTE4MGh4MnZvOHlsZ2IxZm96In0.AcMMGPhLkawMBhBYr1f5hA',
                      'id': "mapbox.mapbox-streets-v8"
                    },
                    subdomains: ['a', 'b', 'c'],
                    backgroundColor: Colors.black),
                new MarkerLayerOptions(markers: [
                  Marker(
                      width: mapMarkerWidth,
                      height: mapMarkerHieght,
                      point: LatLng(33.685032, 73.042714),
                      builder: (context) => new Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_on,
                                size: mapMarkerIconSize,
                              )))),
                  Marker(
                      width: mapMarkerWidth,
                      height: mapMarkerHieght,
                      point: LatLng(33.694173, 73.038034),
                      builder: (context) => new Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_on,
                                size: mapMarkerIconSize,
                              )))),
                  Marker(
                      width: mapMarkerWidth,
                      height: mapMarkerHieght,
                      point: LatLng(33.690246, 73.038077),
                      builder: (context) => new Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_on,
                                size: mapMarkerIconSize,
                              )))),
                  Marker(
                      width: mapMarkerWidth,
                      height: mapMarkerHieght,
                      point: LatLng(33.691817, 73.046494),
                      builder: (context) => new Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_on,
                                size: mapMarkerIconSize,
                              )))),
                  Marker(
                      width: mapMarkerWidth,
                      height: mapMarkerHieght,
                      point: LatLng(33.689639, 73.051647),
                      builder: (context) => new Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_on,
                                size: mapMarkerIconSize,
                              )))),
                ])
              ],
            ),*/
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  color: Colors.white70,
                  width: MediaQuery.of(context).size.width,
                  //height: 230,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 15, bottom: 15, top: 15),
                          child: Text(
                            "Most Popular Shops",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[800]),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            ShopRatingCard(index: 0),
                            ShopRatingCard(index: 1),
                            ShopRatingCard(index: 2),
                            ShopRatingCard(index: 3),
                            ShopRatingCard(index: 4),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            /*  Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Card(
                elevation: 10,
                child: Container(
                  height: 60,
                  padding:
                      EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 8),
                  margin: EdgeInsets.only(left: 8, right: 8),
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                          size: 35,
                        ),
                        hintText: "Search"),
                  ),
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
