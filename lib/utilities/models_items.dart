import 'package:travel_app/features/home/models/city_model.dart';
import 'package:travel_app/features/home/models/service_model.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/app_images.dart';
import 'package:travel_app/utilities/app_texts.dart';

List<CityModel> cities = [
  CityModel(AppTexts.korea, AppImages.korea),
  CityModel(AppTexts.dubay, AppImages.dubay),
  CityModel(AppTexts.antalia, AppImages.antalia),
  CityModel(AppTexts.gavaya, AppImages.gavaya),
  CityModel(AppTexts.mascow, AppImages.mascow),
  CityModel(AppTexts.pekin, AppImages.pekin),
  CityModel(AppTexts.parij, AppImages.parij),
];

List<ServiceModel> serviceItems = [
  ServiceModel(
    AppTexts.flights,
    AppIcons.flight.icon,
    AppColors.flightTop,
    AppColors.flightBottom,
  ),
  ServiceModel(
    AppTexts.hotels,
    AppIcons.hotels.icon,
    AppColors.hotelTop,
    AppColors.hotelBottom,
  ),
  ServiceModel(
    AppTexts.auto,
    AppIcons.auto.icon,
    AppColors.autoTop,
    AppColors.autoBottom,
  ),
  ServiceModel(
    AppTexts.foods,
    AppIcons.foods.icon,
    AppColors.foodTop,
    AppColors.foodBottom,
  ),
  ServiceModel(
    AppTexts.tour,
    AppIcons.tour.icon,
    AppColors.tourTop,
    AppColors.tourBottom,
  ),
];
