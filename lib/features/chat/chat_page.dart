import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/ui_kit/custom_app_bar.dart';
import 'package:travel_app/core/ui_kit/custom_text_field.dart';
import 'package:travel_app/features/home/models/user_model.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/app_texts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.chatPageScaffold,
      appBar: CustomAppBar(
        userModel: widget.userModel,
      ),
      body: Center(
        child: Text(''),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 32,
          right: 33,
          bottom: 39,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTextField(
              topText: '',
              hintText: AppTexts.yourMessage,
              controller: controller,
              textfieldColor: AppColors.white,
              width: MediaQuery.of(context).size.width - 130,
              height: 48,
              sufficIcon: SvgPicture.asset(
                AppIcons.stickers.icon,
                fit: BoxFit.none,
              ),
            ),
            Spacer(),
            GestureDetector(
              child: SvgPicture.asset(AppIcons.voice.icon),
            ),
          ],
        ),
      ),
    );
  }
}
