import 'package:flutter/material.dart';
import 'package:travel_app/utilities/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.topText,
    required this.hintText,
    required this.controller,
    this.textfieldColor,
    this.width,
    this.maxLines,
    this.contentPadding,
    this.height,
    this.sufficIcon,
  });
  final String topText;
  final String hintText;
  final TextEditingController controller;
  final Color? textfieldColor;
  final double? width;
  final int? maxLines;
  final double? height;
  final EdgeInsets? contentPadding;
  final Widget? sufficIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
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
          height: height ?? 42,
          width: width ?? MediaQuery.of(context).size.width - 102,
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: textfieldColor ?? AppColors.textFieldColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: contentPadding ?? EdgeInsets.only(left: 15),
              suffixIcon: sufficIcon,
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
