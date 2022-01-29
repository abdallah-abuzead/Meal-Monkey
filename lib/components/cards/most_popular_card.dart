import 'package:flutter/material.dart';
import 'package:meal_monkey/models/meal.dart';
import '../../app_data.dart';
import '../custom_widgets.dart';

class MostPopularCard extends StatelessWidget {
  MostPopularCard({required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        children: [
          Container(
            width: 228,
            height: 135,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover, image: AssetImage(meal.image)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            height: 50,
            width: 228,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText(meal.name, fontSize: 18),
                Row(
                  children: [
                    Text('Café', style: TextStyle(color: AppData.placeholderColor, fontSize: 12)),
                    Baseline(
                      baselineType: TextBaseline.alphabetic,
                      baseline: 8,
                      child: Text(' . ', style: TextStyle(color: AppData.mainColor, fontSize: 20)),
                    ),
                    Text('Western Food', style: TextStyle(color: AppData.placeholderColor, fontSize: 12)),
                    SizedBox(width: 20),
                    Icon(Icons.star_rate_rounded, color: AppData.mainColor, size: 18),
                    Text(
                      meal.ratingPercentage.toString(),
                      style: TextStyle(color: AppData.mainColor, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
