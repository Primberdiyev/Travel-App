import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/features/chat/models/message_model.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_texts.dart';

class BuildMessage extends StatelessWidget {
  const BuildMessage({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final bool isMe = messageModel.senderId == currentUser?.uid;
    final time = messageModel.timestamp;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.5,
              ),
              decoration: BoxDecoration(
                color: isMe
                    ? AppColors.myMessageColor
                    : AppColors.otherMessageColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isMe ? 15 : 0),
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(isMe ? 0 : 15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Text(
                messageModel.message,
                style: TextStyle(
                  fontFamily: 'AbeeZee',
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              "${time.hour}:"
              "${time.minute.toString().padLeft(2, '0')} "
              "${time.hour >= 12 ? AppTexts.pm : AppTexts.am}\t\t\t\t",
              style: TextStyle(
                fontFamily: 'AbeeZee',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
