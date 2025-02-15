import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/core/base/base_change_notifier.dart';
import 'package:travel_app/utilities/app_texts.dart';
import 'package:travel_app/utilities/statuses.dart';

class SplashProvider extends BaseChangeNotifier {
  final firebase = FirebaseFirestore.instance;
  bool isRegister = false;
  Future chechRegister() async {
    updateState(Statuses.loading);
    final currentUser = FirebaseAuth.instance.currentUser;
    try {
      if (currentUser != null) {
        final response =
            await firebase.collection(AppTexts.user).doc(currentUser.uid).get();
        if (response.exists) {
          isRegister = true;
          updateState(Statuses.completed);
        } else {
          updateState(Statuses.completed);
        }
      } else {
        updateState(Statuses.completed);
      }
    } catch (e) {
      log('error on check register $e');
      updateState(Statuses.error);
    }
  }
}
