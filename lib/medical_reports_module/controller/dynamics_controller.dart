import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/medical_reports_module/model/vitals_model.dart';
import 'package:medtrack/medical_reports_module/model/weight_model.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/dynamics/services/dynamics_services.dart';
import 'package:medtrack/routes/routes_constants.dart';

class DynamicsController extends GetxController {
  final DynamicsServices dynamicsServices = Get.find<DynamicsServices>();
  RxList<BodyVitalsModel> bodyVitalsModelList = RxList<BodyVitalsModel>();
  RxList<WeightModel> weightModelList = RxList<WeightModel>();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  bool isHeightUpdated = false;
  @override
  void onInit() {
    super.onInit();
    debugPrint('onInit()vit');
    getVitalsData();
    getWightData();
  }

  Future<void> saveVitalsData({
    required int sys,
    required int dia,
    required DateTime date,
    int? pulse,
  }) async {
    bool success = await dynamicsServices.saveVitalsData(
      sys: sys,
      dia: dia,
      pulse: pulse,
      date: date,
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
      await getVitalsData();
      Get.toNamed(RouteNames.analytics);
      debugPrint('Data saved successfully');
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
      debugPrint('Error saving data');
    }
  }

  Future<void> getVitalsData() async {
    bool success = await dynamicsServices.getVitalsData();
    if (success) {
      bodyVitalsModelList.assignAll(dynamicsServices.bodyVitalsModelList);
      debugPrint(dynamicsServices.bodyVitalsModelList.toString());
      debugPrint('Data fetched successfully');
    } else {
      bodyVitalsModelList.clear();
      debugPrint('Error fetching data');
    }
  }

  Future<void> deleteVitalsDoc(String docId) async {
    bool success = await dynamicsServices.deleteVitalsDoc(docId);
    if (success) {
      debugPrint('Document deleted successfully');
    } else {
      debugPrint('Error deleting document');
    }
  }

  Future<void> saveWeightData({
    required double wight,
    required DateTime date,
    required double height,
  }) async {
    bool success = await dynamicsServices.saveWeightData(
      wight: wight,
      date: date,
      height: height,
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
      await getWightData();
      Get.toNamed(RouteNames.weightResult);
      debugPrint('Data saved successfully');
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
      debugPrint('Error saving data');
    }
  }

  Future<void> getWightData() async {
    bool success = await dynamicsServices.getWeightData();
    if (success) {
      weightModelList.assignAll(dynamicsServices.weightModelList);
      debugPrint(dynamicsServices.weightModelList.toString());
      debugPrint('wight fetched successfully');
    } else {
      weightModelList.clear();
      debugPrint('Error fetching data');
    }
  }

  Future<void> deleteWeightDoc(String docId) async {
    bool success = await dynamicsServices.deleteWeightDoc(docId);
    if (success) {
      debugPrint('Document deleted successfully');
    } else {
      debugPrint('Error deleting document');
    }
  }

  Future<void> updateHeight(double height) async {
    bool success = await dynamicsServices.updateWeightData(
        weightModelList.first.id!, height);
    if (success) {
      debugPrint('wight updated successfully');
    } else {
      debugPrint('Error updating data');
    }
  }

  void appearanceOfHeightWidget() {
    isHeightUpdated = !isHeightUpdated;
    update();
  }

  double calculateBMI(double height, double weight) {
    final double result = weight / (height * height / 10000);
    return result.roundToDouble();
  }

  String getBMIRange(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else if (bmi < 34.9) {
      return 'Obesity Class I';
    } else if (bmi < 39.9) {
      return 'Obesity Class II';
    } else {
      return 'Obesity Class III';
    }
  }
}
