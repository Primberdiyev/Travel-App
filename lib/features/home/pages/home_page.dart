import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/features/home/widgets/build_city.dart';
import 'package:travel_app/features/home/widgets/home_page_app_bar.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/city_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomePageAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 95,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return BuildCity(
                  cityName: cities[index].name,
                  imagePath: cities[index].imagepath,
                );
              },
            ),
          ),
          SizedBox(
            height: 22,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 16,
            child: SvgPicture.asset(
              AppIcons.slider.icon,
              width: 420,
            ),
          ),
        ],
      ),
    );
  }
}
