import 'package:flutter/material.dart';
import 'package:meal_monkey/models/category.dart';
import '../custom_widgets.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover, image: AssetImage(category.image)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 25,
            width: 88,
            child: titleText(category.name, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
