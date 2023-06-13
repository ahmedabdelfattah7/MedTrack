import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/medical_reports_module/controller/dynamics_controller.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:medtrack/medical_reports_module/view/pages/analytics/widgets/weight_analytics.dart';
import 'package:medtrack/medical_reports_module/view/pages/analytics/widgets/weight_graph.dart';

class WeightResult extends StatelessWidget {
  WeightResult({Key? key}) : super(key: key);
  final DynamicsController weightController = Get.put(DynamicsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          final interpretation = weightController.getBMIRange(
              weightController.calculateBMI(
                  weightController.weightModelList.last.height!,
                  weightController.weightModelList.first.weight));

          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Get.find<ThemeController>().isDarkMode
                            ? AppColors.mainDark
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: WeightGraph(controller: weightController),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Get.find<ThemeController>().isDarkMode
                            ? AppColors.mainDark
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 8, bottom: 16),
                          child: WeightAnalytics(
                              controller: weightController,
                              interpretation: interpretation)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
