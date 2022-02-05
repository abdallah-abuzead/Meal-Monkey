import 'package:flutter/material.dart';
import 'package:meal_monkey/app_data.dart';
import 'package:meal_monkey/components/cards/category_card.dart';
import 'package:meal_monkey/components/cards/most_popular_card.dart';
import 'package:meal_monkey/components/cards/recent_item_card.dart';
import 'package:meal_monkey/components/cards/restaurant_card.dart';
import 'package:meal_monkey/components/custom_widgets.dart';

import '../constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const String id = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Good Morning Akila!', greeting: true),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Delivering to', style: TextStyle(color: AppData.placeholderColor, fontSize: 11)),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Current Location',
                              style: TextStyle(
                                color: AppData.secondaryFontColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 50),
                            Icon(Icons.keyboard_arrow_down, color: AppData.mainColor),
                          ],
                        ),
                        SizedBox(height: 35),
                        TextField(decoration: kSearchFoodDecoration),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  // ===================================================================
                  Container(
                    height: 113,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: AppData.categories.length,
                      itemBuilder: (context, i) {
                        return CategoryCard(category: AppData.categories[i]);
                      },
                    ),
                  ),
                  SizedBox(height: 45),
                  // ====================================================================
                  CustomHeader(title: 'Popular Restaurants'),
                  SizedBox(height: 5),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: AppData.restaurants.length,
                    itemBuilder: (context, i) {
                      return RestaurantCard(restaurant: AppData.restaurants[i]);
                    },
                  ),
                  // ==================================================================
                  CustomHeader(title: 'Most Popular'),
                  SizedBox(height: 5),
                  Container(
                    height: 185,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: AppData.mostPopular.length,
                      itemBuilder: (context, i) {
                        return MostPopularCard(meal: AppData.mostPopular[i]);
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  // ===================================================================
                  CustomHeader(title: 'Recent Items'),
                  SizedBox(height: 5),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: AppData.recentItems.length,
                    itemBuilder: (context, i) {
                      return RecentItemCard(meal: AppData.recentItems[i]);
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
