import 'package:flutter/material.dart';
import 'package:travel_app/core/ui_kit/custom_app_bar.dart';
import 'package:travel_app/features/models/user_model.dart';
import 'package:travel_app/utilities/app_colors.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        userModel: userModel,
      ),
    );
  }
}
