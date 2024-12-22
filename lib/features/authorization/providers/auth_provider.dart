import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future signInWithGooge() async {
    updateState(Statuses.loading);
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      updateState(Statuses.completed);
      return userCredential.user;
    } catch (e) {
      updateState(Statuses.error);
      log("error on google sign in: $e");
    }
  }
}
