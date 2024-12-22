import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_app/core/base/base_change_notifier.dart';
import 'package:travel_app/utilities/statuses.dart';

class GoogleProvider extends BaseChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

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
}
