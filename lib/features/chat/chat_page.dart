import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/ui_kit/custom_app_bar.dart';
import 'package:travel_app/features/chat/models/message_model.dart';
import 'package:travel_app/features/chat/providers/chat_provider.dart';
import 'package:travel_app/features/chat/widgets/build_message.dart';
import 'package:travel_app/features/chat/widgets/chat_page_bottom_navigation.dart';
import 'package:travel_app/features/home/models/user_model.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_texts.dart';
import 'package:travel_app/utilities/message_types.dart';

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
    final receiverId = widget.userModel.id;
    return Consumer<ChatProvider>(builder: (
      context,
      provider,
      child,
    ) {
      return Scaffold(
        backgroundColor: AppColors.chatPageScaffold,
        appBar: CustomAppBar(
          userModel: widget.userModel,
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: provider.getAllMessages(receiverId: receiverId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text(AppTexts.somethingWentWrong);
                  } else if (!snapshot.hasData) {
                    return SizedBox();
                  }
                  final List<MessageModel> messages = snapshot.data ?? [];
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          reverse: true,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            switch (message.messageType) {
                              case MessageTypes.text:
                                return BuildMessage(
                                  messageModel: message,
                                );
                            }
                            return SizedBox();
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            ChatPageBottomNavigation(
              controller: controller,
              receiverId: receiverId,
            ),
          ],
        ),
      );
    });
  }
}
