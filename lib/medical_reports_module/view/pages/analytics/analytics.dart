import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/medical_reports_module/view/pages/analytics/pressure.dart';
import 'package:medtrack/medical_reports_module/view/pages/analytics/weight.dart';

class Analytics extends StatelessWidget {
  const Analytics({Key? key}) : super(key: key);

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
                 WeightResult(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

