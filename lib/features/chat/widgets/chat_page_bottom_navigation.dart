import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/ui_kit/custom_text_field.dart';
import 'package:travel_app/features/chat/providers/chat_provider.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/app_texts.dart';

class ChatPageBottomNavigation extends StatelessWidget {
  const ChatPageBottomNavigation({
    super.key,
    required this.controller,
    required this.receiverId,
  });
  final TextEditingController controller;
  final String receiverId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 33,
        bottom: 39,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Consumer<ChatProvider>(builder: (
            context,
            provider,
            child,
          ) {
            return CustomTextField(
              topText: '',
              hintText: AppTexts.yourMessage,
              controller: controller,
              textfieldColor: AppColors.white,
              width: MediaQuery.of(context).size.width - 130,
              height: 48,
              sufficIcon: GestureDetector(
                onTap: () {
                  if (controller.text.isEmpty) {
                    return;
                  }
                  provider
                      .sendMessage(
                    message: controller.text,
                    receiverUserid: receiverId,
                  )
                      .then((_) {
                    controller.clear();
                  });
                },
                child: SvgPicture.asset(
                  AppIcons.stickers.icon,
                  fit: BoxFit.none,
                ),
              ),
            );
          }),
          Spacer(),
          GestureDetector(
            child: SvgPicture.asset(AppIcons.voice.icon),
          ),
        ],
      ),
    );
  }
}
