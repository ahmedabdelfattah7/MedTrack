import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/medical_reports_module/controller/dynamics_controller.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:medtrack/medical_reports_module/model/vitals_model.dart';
import 'package:medtrack/medical_reports_module/view/pages/analytics/widgets/blood_presuure_graph.dart';
import 'package:medtrack/medical_reports_module/view/pages/analytics/widgets/pulse_graph.dart';
import 'package:medtrack/medical_reports_module/view/widgets/fallback.dart';
import 'package:medtrack/routes/routes_constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalysisChart extends StatelessWidget {
  AnalysisChart({Key? key}) : super(key: key);
  final DynamicsController controller = Get.put(DynamicsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ConditionalBuilder(
          condition: controller.bodyVitalsModelList.isNotEmpty,
          builder: (context) => Padding(
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
                      child: BloodPressureGraph(controller: controller),
                    ),
                  ),
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
                        child: PulseGraph(controller: controller)),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
          fallback: (context) => FallBack(
            onPressed: () {
              Get.toNamed(RouteNames.bodyVitals);
            },
          ),
        ),
      ),
    );
  }
}
