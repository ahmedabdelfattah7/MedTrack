import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/app_module/dynamics/controller/dynamics_controller.dart';
import 'package:medtrack/app_module/dynamics/pages/pressure_output.dart';
import 'package:medtrack/app_module/dynamics/pages/weight_output.dart';

import 'package:medtrack/core/widgets/fallback.dart';
import 'package:medtrack/routes/routes_constants.dart';

class Analytics extends StatelessWidget {
   Analytics({Key? key}) : super(key: key);
  final DynamicsController weightController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(children:  [
          TabBar(
            tabs: <Widget>[
              Tab(
                text: 'pressure'.tr,
              ),
               Tab(
                text:'weight'.tr,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                AnalysisChart(),
    ConditionalBuilder(
    condition: weightController.weightModelList.isNotEmpty,
    builder: (context) {
      return
      WeightResult();
    },
      fallback: (context) => FallBack(
        onPressed: () {
          Get.toNamed(RouteNames.weightInput);
        },
      ),
    ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

