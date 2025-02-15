import 'package:firebase_auth/firebase_auth.dart';

class ChatServices {
  String getConversatioId(String id) {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    return currentUserId.hashCode <= id.hashCode
        ? '${currentUserId}_$id'
        : '${id}_$currentUserId';
  }
}
