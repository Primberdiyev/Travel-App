import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/core/base/base_change_notifier.dart';

class ImagesProvider extends BaseChangeNotifier {
  File? selectedImage;
  String? imageUrl;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  Future pickImage() async {
    try {
      final imagePicker = ImagePicker();
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      }
    } catch (e) {
      log('error on picking images $e');
    }
    notifyListeners();
  }

  Future uploadImageToStorage() async {
    try {
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef =
          FirebaseStorage.instance.ref().child('usersImages/$fileName');
      await storageRef.putFile(selectedImage ?? File(''));
      imageUrl = await storageRef.getDownloadURL();
      saveImageId();
    } catch (e) {
      log('error on uploading image to Storage $e');
    }
  }

  Future saveImageId() async {
    try {
      await firebaseFirestore.collection('users').doc(currentUser?.uid).set(
        {
          'storiesId': FieldValue.arrayUnion(
            [imageUrl],
          ),
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      log('erron on pushing id to firebase');
    }
  }
}
