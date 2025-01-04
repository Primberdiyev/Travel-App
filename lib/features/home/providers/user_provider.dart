import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/core/base/base_change_notifier.dart';
import 'package:travel_app/features/models/user_model.dart';

class UserProvider extends BaseChangeNotifier {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<UserModel> allUsers = [];
  Future getAllUsers() async {
    try {
      final response = await firebaseFirestore.collection('User').get();
      for (var element in response.docs) {
        final user = UserModel.fromJson(element.data());

        if (user.storiesId?.isNotEmpty ?? false) {
          allUsers.add(user);
        }
      }
    } catch (e) {
      log('error on getting user\'s model $e');
    }

    notifyListeners();
  }
}
