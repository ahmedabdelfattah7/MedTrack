import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/utils/constants.dart';
import 'package:medtrack/medical_reports_module/model/vitals_model.dart';
import 'package:medtrack/medical_reports_module/model/weight_model.dart';

class DynamicsServices extends GetxService {
  RxList<BodyVitalsModel> bodyVitalsModelList = RxList<BodyVitalsModel>();
  RxList<WeightModel> weightModelList = RxList<WeightModel>();
  Future<bool> saveVitalsData({
    required int sys,
    required int dia,
    int? pulse,
    required DateTime date,
  }) async {
    try {
      BodyVitalsModel bodyVitalsModel = BodyVitalsModel(
        sys: sys,
        dia: dia,
        pulse: pulse ?? 0,
        date: date,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('body vitals')
          .add(bodyVitalsModel.toJson());

      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

  Future<bool> getVitalsData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('body vitals')
          .orderBy('date', descending: true)
          .get();
      final data = snapshot.docs
          .map((doc) => BodyVitalsModel.fromJson({
                ...doc.data(),
                'id': doc.id,
              }))
          .toList();

      bodyVitalsModelList.assignAll(data);
      return true;
    } catch (error) {
      debugPrint('Error fetching data: $error');
      bodyVitalsModelList.clear();
      return false;
    }
  }

  Future<bool> deleteVitalsDoc(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('body vitals')
          .doc(docId)
          .delete();
      debugPrint('Document deleted successfully');
      return true;
    } catch (e) {
      debugPrint('Error deleting document: $e');
      return false;
    }
  }
  Future<bool> saveWeightData({
    required double wight,
    required DateTime date,
    required double height,
  }) async {
    try {
     WeightModel weightModel =WeightModel(weight: wight, date: date,height: height );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('weight')
          .add(weightModel.toJson());

      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

  Future<bool> getWeightData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('weight')
          .orderBy('date', descending: true)
          .get();
      final data = snapshot.docs
          .map((doc) => WeightModel.fromJson({
        ...doc.data(),
        'id': doc.id,
      }))
          .toList();

      weightModelList.assignAll(data);
      return true;
    } catch (error) {
      debugPrint('Error fetching data: $error');
      weightModelList.clear();
      return false;
    }
  }

  Future<bool> deleteWeightDoc(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('weight')
          .doc(docId)
          .delete();
      debugPrint('Document deleted successfully');
      return true;
    } catch (e) {
      debugPrint('Error deleting document: $e');
      return false;
    }
  }
  Future<bool> updateWeightData(String docId, double height) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('weight')
          .doc(docId)
          .update({'height': height});

      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }
}
