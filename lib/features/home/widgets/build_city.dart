import 'package:flutter/material.dart';
import 'package:travel_app/utilities/app_colors.dart';

class BuildCity extends StatelessWidget {
  const BuildCity({
    super.key,
    required this.cityName,
    required this.imagePath,
  });
  final String cityName;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          margin: EdgeInsets.only(
            left: 10,
            bottom: 11,
          ),
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xFFFAEF20),
                Color(0xFFFAEF20),
                Color(0xFFD98160),
                Color(0xFFC94B80),
                Color(0xFFB814A0),
                Color(0xFFBD2198),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            height: 58,
            width: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          cityName,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.black,
            fontFamily: 'Laila',
          ),
        ),
      ],
    );
  }
}
