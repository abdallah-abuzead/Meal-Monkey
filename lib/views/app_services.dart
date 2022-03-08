import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/components/custom_widgets.dart';
import 'package:meal_monkey/components/rounded_button.dart';
import 'package:meal_monkey/views/welcome.dart';

import '../app_data.dart';

class AppServices extends StatefulWidget {
  const AppServices({Key? key}) : super(key: key);
  static const String id = '/app_services';

  @override
  _AppServicesState createState() => _AppServicesState();
}

class _AppServicesState extends State<AppServices> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> imageSliders = AppData.appServices.map((item) => Image.asset(item['image'])).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      height: 296,
                      onPageChanged: (index, reason) => setState(() => _current = index),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageSliders.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == entry.key ? AppData.mainColor : Color(0XFFD6D6D6),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 41),
                  titleText(AppData.appServices[_current]['title'], fontSize: 28),
                  SizedBox(height: 38),
                  smallText(AppData.appServices[_current]['description']),
                  SizedBox(height: 60),
                  RoundedButton(
                    color: AppData.mainColor,
                    child: Text('Next', style: TextStyle(color: Colors.white, fontSize: 16)),
                    onPressed: () => Get.offNamed(Welcome.id),
                  ),
                ],
              ),
            ),
            Divider(color: AppData.primaryFontColor, thickness: 5, indent: 100, endIndent: 100),
          ],
        ),
      ),
    );
  }
}
