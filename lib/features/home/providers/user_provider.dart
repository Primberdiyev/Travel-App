import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/core/base/base_change_notifier.dart';
import 'package:travel_app/features/home/models/user_model.dart';

class UserProvider extends BaseChangeNotifier {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<UserModel> allUsers = [];
  UserModel? mySelf;
  final currentUser = FirebaseAuth.instance.currentUser;
  Future getAllUsers() async {
    try {
      await getUserModel(currentUser?.uid);
      final response = await firebaseFirestore.collection('User').get();
      allUsers = response.docs
          .map((doc) => UserModel.fromJson(doc.data()))
          .where(
            (user) => user.id != currentUser?.uid && user.storiesId != null,
          )
          .toList();
    } catch (e, stackTrace) {
      log('error on getting user\'s model $e stackTrace : $stackTrace');
    }

    notifyListeners();
  }

  Future<void> getUserModel(String? id) async {
    final response = await firebaseFirestore.collection('User').doc(id).get();
    mySelf = UserModel.fromJson(response.data() ?? {});
    notifyListeners();
  }
}
