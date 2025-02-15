import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/core/base/base_change_notifier.dart';
import 'package:travel_app/features/chat/models/message_model.dart';
import 'package:travel_app/features/chat/services/chat_services.dart';
import 'package:travel_app/utilities/app_texts.dart';

class ChatProvider extends BaseChangeNotifier {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> sendMessage({
    required String receiverUserid,
    required String message,
  }) async {
    final now = DateTime.now();
    final firestoreDetail = firestore.collection(AppTexts.chats);
    final conversationId = ChatServices().getConversatioId(receiverUserid);
    final firebaseUniqueId = firestoreDetail.doc().id;
    final messageModel = MessageModel(
      id: firebaseUniqueId,
      senderId: auth.currentUser?.uid ?? "",
      receiverId: receiverUserid,
      message: message,
      timestamp: now,
    );
    try {
      await firestoreDetail
          .doc("$conversationId/messages/${messageModel.id}")
          .set(
            messageModel.toJson(),
            SetOptions(merge: true),
          );
    } catch (e) {
      log('error during sending message $e');
    }
  }
}
