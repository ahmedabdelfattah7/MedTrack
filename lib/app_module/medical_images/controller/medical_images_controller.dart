import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/app_module/medical_images/model/medical_Image%20_model.dart';
import 'package:medtrack/app_module/medical_images/services/medical_images_services.dart';

class MedicalImagesController extends GetxController {
  MedicalImagesServices medicalImagesServices = Get.find();
  RxList<MedicalImagesModel> medicalImagesList = RxList<MedicalImagesModel>();

  @override
  void onInit() {
    super.onInit();
    fetchImagesForUser();
  }

  Future<void> pickAndUploadImage() async {
    bool success = await medicalImagesServices.pickAndUploadImage();
    if (success) {
      await fetchImagesForUser();
    } else {
      debugPrint('Error uploading image');
      Get.snackbar('Error', 'Failed to upload image. Please try again later.');
    }
  }

  Future<void> fetchImagesForUser() async {
    bool success = await medicalImagesServices.fetchImagesForUser();
    if (success) {
      medicalImagesList.assignAll(medicalImagesServices.medicalImagesList);
      debugPrint(medicalImagesServices.medicalImagesList.toString());
    } else {
      medicalImagesList.clear();
      debugPrint('Error fetching data');
    }
  }

  Future<void> deleteImage(String imageId) async {
    bool success = await medicalImagesServices.deleteImage(imageId);
    if (success) {
      Get.snackbar(
        'Success!',
        'Document deleted successfully',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.check_circle, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
      await fetchImagesForUser();
    } else {
      Get.snackbar(
        'Error!',
        'Failed to delete document',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
