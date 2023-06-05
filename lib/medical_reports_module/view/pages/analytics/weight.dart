import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/medical_reports_module/controller/dynamics_controller.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:medtrack/medical_reports_module/view/pages/analytics/widgets/weight_graph.dart';
import 'package:medtrack/medical_reports_module/view/widgets/fallback.dart';
import 'package:medtrack/routes/routes_constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WeightResult extends StatelessWidget {
  WeightResult({Key? key}) : super(key: key);
  final DynamicsController controller = Get.put(DynamicsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ConditionalBuilder(
        condition: controller.weightModelList.isNotEmpty,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 550,
                  width: double.infinity,
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
                  child: WeightGraph(controller: controller),
                ),
                Text(
                    'this is last wight ${controller.weightModelList.first.weight}'),
                Text(
                    'this is last height ${controller.weightModelList.first.height}'),
                Center(
                  child:SfRadialGauge(
                    title: const GaugeTitle(
                      text: 'BMI',
                      alignment: GaugeAlignment.center,
                    ),
                    axes: <RadialAxis>[
                      RadialAxis(
                        canScaleToFit: false,
                        showLabels: false,
                        showAxisLine: true,
                        showTicks: true,
                        canRotateLabels: true,
                        labelOffset:0,
                        labelsPosition: ElementsPosition.outside,
                        minimum: 0,
                        maximum: 100,
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: 31.5,
                            color: Colors.lightBlue,
                            label: 'Underweight',
                            sizeUnit: GaugeSizeUnit.factor,
                            labelStyle: const GaugeTextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            startWidth: 0.40,
                            endWidth: 0.40,
                          ),
                          GaugeRange(
                            startValue: 32,
                            endValue: 63.5,
                            color: Colors.green,
                            label: 'Normal',
                            labelStyle: const GaugeTextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            startWidth: 0.40,
                            endWidth: 0.40,
                            sizeUnit: GaugeSizeUnit.factor,
                          ),
                          GaugeRange(
                            startValue: 64,
                            endValue: 99,
                            color: Colors.redAccent,
                            label: 'Fast',
                            labelStyle: const GaugeTextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.40,
                            endWidth: 0.40,
                          ),
                        ],
                        pointers: const <GaugePointer>[
                          MarkerPointer(
                            value: 40,
                            markerHeight: 30,
                            markerWidth: 30,
                            markerOffset: 55,
                            markerType: MarkerType.triangle,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),


                ),
              ],
            ),
          ),
        ),
        fallback: (context) => FallBack(
          onPressed: () {
            Get.toNamed(RouteNames.weightInput);
          },
        ),
      ),
    );
  }
}
