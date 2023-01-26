class ShopsList {
  String? shopName;
  String? shopDistance;
  double? shopRating;
  String? shopPhotoURL;
  ShopsList(
      {this.shopName, this.shopDistance, this.shopRating, this.shopPhotoURL});
}

List<ShopsList> shopList = [
  ShopsList(
    shopName: "Magical Dry Cleaning ",
    shopDistance: "3 Km",
    shopRating: 4.5,
    shopPhotoURL: 'assets/magical.png',
  ),
  ShopsList(
    shopName: "Clean & Clear Dry Cleaning ",
    shopDistance: "5 Km",
    shopRating: 4.1,
    shopPhotoURL: 'assets/clean_clear.png',
  ),
  ShopsList(
    shopName: "Awesome Dry Cleaning ",
    shopDistance: "2 Km",
    shopRating: 3.8,
    shopPhotoURL: 'assets/awesome.png',
  ),
  ShopsList(
    shopName: "A-one Dry Cleaning ",
    shopDistance: "3 Km",
    shopRating: 3.5,
    shopPhotoURL: 'assets/a_one.png',
  ),
  ShopsList(
    shopName: "Blue's Laundromat ",
    shopDistance: "1 Km",
    shopRating: 3.7,
    shopPhotoURL: 'assets/blue_laundry.png',
  )
];
