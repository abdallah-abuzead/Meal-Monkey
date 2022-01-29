import 'dart:ui';
import 'package:meal_monkey/models/category.dart';
import 'package:meal_monkey/models/meal.dart';
import 'package:meal_monkey/models/restaurant.dart';

class AppData {
  static String appName = 'Meal Monkey';

  // App Colors
  static Color mainColor = Color(0XFFFC6011);
  static Color primaryFontColor = Color(0XFF4A4B4D);
  static Color secondaryFontColor = Color(0XFF7C7D7E);
  static Color placeholderColor = Color(0XFFB6B7B7);
  static Color facebookColor = Color(0XFF367FC0);
  static Color googleColor = Color(0XFFDD4B39);
  static Color textFieldFillColor = Color(0XFFF2F2F2);

  static List<Map> appServices = [
    {
      'title': 'Find Food You Love',
      'description': 'Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep',
      'image': 'images/app_services/find_food_you_love.png',
    },
    {
      'title': 'Fast Delivery',
      'description': 'Fast food delivery to your home, office \n wherever you are',
      'image': 'images/app_services/fast_delivery.png',
    },
    {
      'title': 'Live Tracking',
      'description': 'Real time tracking of your food on the app \n once you placed the order',
      'image': 'images/app_services/live_tracking.png',
    },
  ];

  static List<Category> categories = [
    Category(name: 'Offers', image: 'images/categories/offers.png'),
    Category(name: 'Sri Lankan', image: 'images/categories/sri_lankan.png'),
    Category(name: 'Italian', image: 'images/categories/italian.png'),
    Category(name: 'Indian', image: 'images/categories/indian.png'),
  ];

  static List<Restaurant> restaurants = [
    Restaurant(name: 'Minute by tuk tuk', image: 'images/restaurants/minute_by_tuk_tuk.png'),
    Restaurant(name: 'Café de Noir', image: 'images/restaurants/cafe_de_noir.png'),
    Restaurant(name: 'Bakes by Tella', image: 'images/restaurants/bakes_by_tella.png'),
  ];

  static List<Meal> mostPopular = [
    Meal(name: 'Café De Bambaa', image: 'images/meals/cafe_de_bambaa.png'),
    Meal(name: 'Burger by Bella', image: 'images/meals/burger_by_bella.png'),
  ];

  static List<Meal> recentItems = [
    Meal(name: 'Mulberry Pizza by Josh', image: 'images/meals/mulberry_pizza_by_josh.png', type: 'Western Food'),
    Meal(name: 'Barita', image: 'images/meals/barita.png', type: 'Coffee'),
    Meal(name: 'Pizza Rush Hour', image: 'images/meals/pizza_rush_hour.png', type: 'Italian Food'),
  ];
}
