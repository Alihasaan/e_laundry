import 'package:e_laundry/Constants/constants.dart';
import 'package:e_laundry/Models/shopDetailsList.dart';
import 'package:e_laundry/Screens/ShopDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShopRatingCard extends StatelessWidget {
  final int index;
  ShopRatingCard({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 100,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ShopDetails(
                        shopNameDetails: shopList[index].shopName! +
                            "(" +
                            shopList[index].shopDistance! +
                            ")")));
          },
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: 60,
                  image: AssetImage(shopList[index].shopPhotoURL!),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: Text(
                        shopList[index].shopName!,
                        style: TextStyle(fontSize: 16, color: scText),
                      ),
                    ),
                    RatingBarIndicator(
                      rating: shopList[index].shopRating!,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 17.0,
                      unratedColor: Colors.amber.withAlpha(50),
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                Text(
                  shopList[index].shopDistance!,
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: priText),
                ),
                Icon(Icons.location_on)
              ],
            ),
          ),
        ));
  }
}
