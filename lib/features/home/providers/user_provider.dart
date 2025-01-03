import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/core/base/base_change_notifier.dart';
import 'package:travel_app/features/models/user_model.dart';

class UserProvider extends BaseChangeNotifier {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<UserModel> allUsers = [];
  Future getAllUsers() async {
    try {
      final response = await firebaseFirestore.collection('users').get();
      for (var element in response.docs) {
        allUsers.add(UserModel.fromJson(element.data()));
      }
    } catch (e) {
      log('error on getting user\'s model');
    }

    notifyListeners();
  }
}
