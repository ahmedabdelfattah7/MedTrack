import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medtrack/app_module/medical_images/model/medical_Image%20_model.dart';
import 'package:medtrack/core/utils/constants.dart';

class MedicalImagesServices extends GetxService {
  final picker = ImagePicker();
  RxList<MedicalImagesModel> medicalImagesList = RxList<MedicalImagesModel>();

  Future<bool> pickAndUploadImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        final fileName = '$userUid-${file.path.split('/').last}';
        final firebaseStorageRef =
            FirebaseStorage.instance.ref().child(fileName);
        final uploadTask = firebaseStorageRef.putFile(file);
        await uploadTask.whenComplete(() async {
          final downloadUrl = await firebaseStorageRef.getDownloadURL();
          final now = DateTime.now();
          final medicalImages = MedicalImagesModel(
            id: '',
            userId: userUid!,
            imageUrl: downloadUrl,
            createdAt: now,
          );
          final documentReference = await FirebaseFirestore.instance
              .collection('users')
              .doc(userUid)
              .collection('images')
              .add(medicalImages.toDocument());
          medicalImages.id = documentReference.id;
          medicalImagesList.add(medicalImages);
          print('Image uploaded to Firebase: $downloadUrl');
        });
      }
      return true;
    } catch (e) {
      print('Error uploading image: $e');
      return false;
    }
  }

  Future<bool> fetchImagesForUser() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection('images')
        .orderBy('created_at', descending: true)
        .get();
    final documents = querySnapshot.docs;
    final fetchedImages = documents
        .map((document) => MedicalImagesModel.fromDocument(document))
        .toList();
    medicalImagesList.assignAll(fetchedImages);
    return true;
  }

  Future<bool> deleteImage(String imageId) async {
    try {
      final imageDocument = FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('images')
          .doc(imageId);
      final imageSnapshot = await imageDocument.get();
      if (!imageSnapshot.exists) {
        throw Exception('Image not found in Firestore');
      }
      final imageUrl = imageSnapshot.data()?['image_url'];
      if (imageUrl != null) {
        FirebaseStorage.instance.refFromURL(imageUrl).delete();
      }
      await imageDocument.delete();
      medicalImagesList.removeWhere((image) => image.id == imageId);
      return true;
    } catch (e) {
      print('Error deleting image: $e');
      return false;
    }
  }


}
