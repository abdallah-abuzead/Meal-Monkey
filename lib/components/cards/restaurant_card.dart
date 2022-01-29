import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meal_monkey/components/custom_widgets.dart';
import 'package:meal_monkey/models/restaurant.dart';
import '../../app_data.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard({required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: Image.asset(restaurant.image, fit: BoxFit.cover), height: 193, width: Get.width),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(restaurant.name, fontSize: 16),
              Row(
                children: [
                  Icon(Icons.star_rate_rounded, color: AppData.mainColor, size: 18),
                  Text(
                    restaurant.ratingPercentage.toString(),
                    style: TextStyle(color: AppData.mainColor, fontSize: 11),
                  ),
                  Text(
                    ' (${restaurant.ratingCount} ratings) Café',
                    style: TextStyle(color: AppData.placeholderColor, fontSize: 12),
                  ),
                  Baseline(
                    baselineType: TextBaseline.alphabetic,
                    baseline: 8,
                    child: Text(' . ', style: TextStyle(color: AppData.mainColor, fontSize: 20)),
                  ),
                  Text('Western Food', style: TextStyle(color: AppData.placeholderColor, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
