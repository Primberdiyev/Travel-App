import 'package:flutter/material.dart';

class ServiceModel {
  const ServiceModel(
    this.name,
    this.iconPath,
    this.topColor,
    this.bottomColor,
  );
  final String iconPath;
  final String name;
  final Color topColor;
  final Color bottomColor;
}
