import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/medical_reports_module/model/medical_history_model.dart';

class MedicalHistoryController extends GetxController {
  RxList<MedicalHistoryModel> medicalHistoryList = RxList<MedicalHistoryModel>();
  @override
  void onInit() {
    super.onInit();
    debugPrint('onInit()med');
    getData();
  }

  Future<void> saveData({
    required String date,
    required String doctorName,
    required String diagnosis,
    required String complain,
  }) async {
    try {
      MedicalHistoryModel medicalHistoryModel = MedicalHistoryModel(
        complain: complain,
        date: date,
        doctorName: doctorName,
        diagnosis: diagnosis,
      );

      FirebaseFirestore.instance
          .collection('medical history')
          .add(medicalHistoryModel.toJson());

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
    } catch (error) {
      debugPrint(error.toString());
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

  Future<void> getData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('medical history')
          .orderBy('date', descending: true)
          .get();
      final data = snapshot.docs
          .map((doc) => MedicalHistoryModel.fromJson({
                ...doc.data(),
                'id': doc.id,
              }))
          .toList();

      medicalHistoryList.addAll(data);

    } catch (error) {
      debugPrint('Error fetching data: $error');
      medicalHistoryList.clear();
    }
  }

  Future<void> deleteDoc(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('medical history')
          .doc(docId)
          .delete();
      debugPrint('Document deleted successfully');
    } catch (e) {
      debugPrint('Error deleting document: $e');
    }
  }
}
