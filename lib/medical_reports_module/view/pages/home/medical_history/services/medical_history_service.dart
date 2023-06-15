import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/utils/constants.dart';
import 'package:medtrack/medical_reports_module/model/medical_history_model.dart';

class MedicalHistoryService extends GetxService {
  RxList<MedicalHistoryModel> medicalHistoryList =
      RxList<MedicalHistoryModel>();

  Future<bool> saveData({
    required String date,
    required String doctorName,
    required String diagnosis,
    required String complain,
  }) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      MedicalHistoryModel medicalHistoryModel = MedicalHistoryModel(
        complain: complain,
        date: date,
        doctorName: doctorName,
        diagnosis: diagnosis,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('medical history')
          .add(medicalHistoryModel.toJson());

      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

  Future<bool> getData() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('medical history')
          .orderBy('date', descending: true)
          .get();
      final data = snapshot.docs
          .map((doc) => MedicalHistoryModel.fromJson({
                ...doc.data(),
                'id': doc.id,
              }))
          .toList();

      medicalHistoryList.assignAll(data);
      return true;
    } catch (error) {
      debugPrint('Error fetching data: $error');
      medicalHistoryList.clear();
      return false;
    }
  }

  Future<bool> deleteDoc(String docId) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('medical history')
          .doc(docId)
          .delete();
      debugPrint('Document deleted successfully');
      return true;
    } catch (e) {
      debugPrint('Error deleting document: $e');
      return false;
    }
  }
}
