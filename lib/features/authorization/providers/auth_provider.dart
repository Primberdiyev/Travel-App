import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_app/core/base/base_change_notifier.dart';
import 'package:travel_app/features/models/user_model.dart';
import 'package:travel_app/utilities/statuses.dart';

class AuthProvider extends BaseChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      updateState(Statuses.loading);
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await registerFireStore(
        name: name,
        id: auth.currentUser?.uid ?? '',
        email: email,
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

  Future<bool?> signInWithGooge(bool isSignIn) async {
    updateState(Statuses.loading);
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final List<String> signInMethods =
          await auth.fetchSignInMethodsForEmail(googleUser.email);

      if (isSignIn) {
        if (signInMethods.isNotEmpty) {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);
          updateState(Statuses.completed);
          return userCredential.user != null;
        } else {
          updateState(Statuses.error);
          return false;
        }
      } else {
        if (signInMethods.isEmpty) {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);
          updateState(Statuses.completed);
          return userCredential.user != null;
        } else {
          updateState(Statuses.error);
          return false;
        }
      }
    } catch (e) {
      updateState(Statuses.error);
      log("error on google sign in: $e");
      return false;
    }
  }

  Future registerFireStore({
    required String name,
    required String id,
    required String email,
  }) async {
    final UserModel userModel = UserModel(
      name: name,
      id: id,
      email: email,
    );
    await firebaseFirestore
        .collection('User')
        .doc(auth.currentUser?.uid)
        .set(userModel.toJson(), SetOptions(merge: true));
  }
}
