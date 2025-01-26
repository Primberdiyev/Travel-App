import 'package:flutter/material.dart';
import 'package:travel_app/utilities/app_styles.dart';

class UserDataItem extends StatelessWidget {
  const UserDataItem({
    super.key,
    required this.count,
    required this.text,
  });
  final int count;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          count.toString(),
          style: AppStyles.body15w600,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: AppStyles.body10w300,
        ),
      ],
    );
  }
}
