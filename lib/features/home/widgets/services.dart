import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/features/home/models/service_model.dart';
import 'package:travel_app/utilities/app_colors.dart';

class Services extends StatelessWidget {
  const Services({
    super.key,
    required this.serviceModel,
  });
  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                serviceModel.topColor,
                serviceModel.bottomColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SvgPicture.asset(
            serviceModel.iconPath,
            fit: BoxFit.none,
          ),
        ),
        Text(
          serviceModel.name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.buttonColor,
          ),
        ),
      ],
    );
  }
}
