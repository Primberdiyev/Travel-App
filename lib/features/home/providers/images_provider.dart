import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_imagekit/flutter_imagekit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/core/base/base_change_notifier.dart';
import 'package:travel_app/utilities/api_keys.dart';
import 'package:travel_app/utilities/app_texts.dart';
import 'package:travel_app/utilities/statuses.dart';

class ImagesProvider extends BaseChangeNotifier {
  File? selectedImage;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  List storyImagesLink = [];
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

  // Future uploadImageToStorage() async {
  //   updateState(Statuses.loading);
  //   try {
  //     final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //     final storageRef =
  //         FirebaseStorage.instance.ref().child('usersImages/$fileName');
  //     await storageRef.putFile(selectedImage ?? File(''));
  //     String imageUrl = await storageRef.getDownloadURL();
  //     await saveImageId(imageUrl);
  //     await getAllImages();
  //     updateState(Statuses.completed);
  //   } catch (e) {
  //     log('error on uploading image to Storage $e');
  //     updateState(Statuses.error);
  //   }
  // }

  Future uploadImageToImageKit() async {
    updateState(Statuses.loading);
    try {
      String imageUrl = '';
      await ImageKit.io(selectedImage, privateKey: ApiKeys.imageKit)
          .then((String link) {
        imageUrl = link;
      });
      await saveImageId(imageUrl);
      await getAllImages();
      updateState(Statuses.completed);
    } catch (e) {
      log('error on uploading image to Storage $e');
      updateState(Statuses.error);
    }
  }

  Future saveImageId(String imageUrl) async {
    try {
      await firebaseFirestore
          .collection(AppTexts.user)
          .doc(currentUser?.uid)
          .set(
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

  Future<void> getAllImages() async {
    try {
      final response = await firebaseFirestore
          .collection(AppTexts.user)
          .doc(currentUser?.uid)
          .get();
      final data = response.data() as Map<String, dynamic>;
      storyImagesLink = data['storiesId'] as List;
    } catch (e) {
      log('error on getting images $e');
    }
    notifyListeners();
  }
}
