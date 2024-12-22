import 'package:flutter/material.dart';
import 'package:travel_app/utilities/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.topText,
    required this.hintText,
    required this.controller,
  });
  final String topText;
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topText,
          style: TextStyle(
            color: AppColors.topTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 13,
        ),
        SizedBox(
          height: 42,
          width: MediaQuery.of(context).size.width - 102,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.textFieldColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.only(left: 15),
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.hintTextColor,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
