import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/core/base/base_change_notifier.dart';
import 'package:travel_app/utilities/statuses.dart';

class AuthProvider extends BaseChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> signUp({required String email, required String password}) async {
    try {
      updateState(Statuses.loading);
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      updateState(Statuses.completed);
    } catch (e) {
      updateState(Statuses.error);
      log("error on sign up: $e");
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      updateState(Statuses.loading);
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      updateState(Statuses.completed);
    } catch (e) {
      updateState(Statuses.error);
      log("error on sign in: $e");
    }
  }
}
