import 'package:flutter/material.dart';
import 'package:meal_monkey/models/meal.dart';
import '../../app_data.dart';

class RecentItemCard extends StatelessWidget {
  RecentItemCard({required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover, image: AssetImage(meal.image)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal.name,
                style: TextStyle(fontSize: 18, color: AppData.primaryFontColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text('Café', style: TextStyle(color: AppData.placeholderColor, fontSize: 11)),
                  Baseline(
                    baselineType: TextBaseline.alphabetic,
                    baseline: 8,
                    child: Text(' .', style: TextStyle(color: AppData.mainColor, fontSize: 20)),
                  ),
                  Text(meal.type, style: TextStyle(color: AppData.placeholderColor, fontSize: 11)),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.star_rate_rounded, color: AppData.mainColor, size: 18),
                  Text(
                    meal.ratingPercentage.toString(),
                    style: TextStyle(color: AppData.mainColor, fontSize: 11),
                  ),
                  Text(
                    '  (${meal.ratingCount} Ratings)',
                    style: TextStyle(color: AppData.placeholderColor, fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
