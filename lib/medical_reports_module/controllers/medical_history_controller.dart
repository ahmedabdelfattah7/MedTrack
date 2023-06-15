import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/medical_reports_module/model/medical_history_model.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/medical_history/services/medical_history_service.dart';
import 'package:medtrack/routes/routes_constants.dart';

class MedicalHistoryController extends GetxController {
  final MedicalHistoryService medicalHistoryService =
      Get.find<MedicalHistoryService>();

  RxList<MedicalHistoryModel> medicalHistoryList =
      RxList<MedicalHistoryModel>();

  @override
  void onInit() {
    super.onInit();
    debugPrint('onInit()med');
    fetchData();
  }

  Future<void> saveData({
    required String date,
    required String doctorName,
    required String diagnosis,
    required String complain,
  }) async {
    bool success = await medicalHistoryService.saveData(
      date: date,
      doctorName: doctorName,
      diagnosis: diagnosis,
      complain: complain,
    );

    if (success) {
      Get.snackbar(
        'Success!',
        'Data saved successfully',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.check_circle, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
      await fetchData();
      Get.toNamed(RouteNames.medicalHistory);
    } else {
      Get.snackbar(
        'Error!',
        'Failed to save data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> fetchData() async {
    bool success = await medicalHistoryService.getData();

    if (success) {
      medicalHistoryList.assignAll(medicalHistoryService.medicalHistoryList);
    } else {
      Get.snackbar(
        'Error!',
        'Failed to fetch data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> deleteDoc(String docId) async {
    bool success = await medicalHistoryService.deleteDoc(docId);

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
      await fetchData();
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
