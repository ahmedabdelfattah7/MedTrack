import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/app_module/prescription_module/model/prescription_model.dart';
import 'package:medtrack/app_module/prescription_module/services/prescription_service.dart';


class PrescriptionController extends GetxController {
  final PrescriptionServices prescriptionServices =
      Get.find<PrescriptionServices>();

  RxList<PrescriptionModel> drugs = RxList<PrescriptionModel>([]);

  @override
  void onInit() async {
    super.onInit();
    drugs.bindStream(prescriptionServices.drugs.stream);
    await prescriptionServices.initDatabase();
    //  drugs.addAll(await prescriptionServices.getDrugs());
  }

  Future<void> saveDrug(PrescriptionModel prescriptionModel) async {
    bool success = await prescriptionServices.saveDrug(prescriptionModel);
    if (success) {
      loadDrugs();

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
      Get.back();
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

  Future<void> loadDrugs() async {
    drugs.value = await prescriptionServices.getDrugs();
  }

  Future<void> deleteDrug(int id) async {
    await prescriptionServices.deleteDrug(id);
  }

  Future<void> updateDrug(PrescriptionModel drug) async {
    await prescriptionServices.updateDrug(drug);
  }

  bool isBottomSheetShown = false;
  IconData? fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    update();
  }
}
