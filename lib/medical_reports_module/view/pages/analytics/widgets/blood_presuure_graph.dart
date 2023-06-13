
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:medtrack/medical_reports_module/controller/dynamics_controller.dart';
import 'package:medtrack/medical_reports_module/model/vitals_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BloodPressureGraph extends StatelessWidget {
  const BloodPressureGraph({
    super.key,
    required this.controller,
  });

  final DynamicsController controller;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(
        text: 'pressure'.tr,
        textStyle: Theme.of(context).textTheme.displayMedium,
      ),
      legend: Legend(
        isVisible: true,
        textStyle: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(fontSize: 16),
      ),
      primaryXAxis: CategoryAxis(
        labelStyle: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(fontSize: 16),
        majorGridLines: const MajorGridLines(width: 2),
        labelRotation: 300,
        arrangeByIndex: false,
        associatedAxisName: 'Date',
        name: 'date',
      ),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}\n mmhg'.tr,
        minimum: 60,
        maximum: 220,
        interval: 10,
        labelStyle: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(fontSize: 16),
        majorGridLines: const MajorGridLines(width: 1),
        axisLine: const AxisLine(width: 2),
      ),
      series: <LineSeries<BodyVitalsModel, String>>[
        LineSeries<BodyVitalsModel, String>(
            name: 'sys'.tr,
            dataSource: controller.bodyVitalsModelList,
            xValueMapper: (BodyVitalsModel data, _) =>
                DateFormat.MMMd().format(data.date),
            yValueMapper: (BodyVitalsModel data, _) =>
            data.sys,
            color: Colors.blue,
            pointColorMapper: (BodyVitalsModel data, _) => Colors.blue,
            width: 2,
            markerSettings: const MarkerSettings(
                color: Colors.blue, isVisible: true),
            onPointTap: (value) {
              showDialog(
                  context: context,
                  builder: (context) {
                    BodyVitalsModel data =
                    controller.bodyVitalsModelList[
                    value.pointIndex!];
                    return AlertDialog(
                      title: Center(
                        child: Text(
                          'Record details',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium,
                        ),
                      ),
                      backgroundColor:
                      Get.find<ThemeController>()
                          .isDarkMode
                          ? Colors.grey[700]
                          : Colors.white,
                      content: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    'Date: ${DateFormat.MMMd().format(data.date)}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    'Systolic: ${data.sys} mmHg',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Text(
                                    'Diastolic: ${data.dia} mmHg',
                                    style: const TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }),
        LineSeries<BodyVitalsModel, String>(
            name: 'dia'.tr,
            dataSource: controller.bodyVitalsModelList,
            xValueMapper: (BodyVitalsModel data, _) =>
                DateFormat.MMMd().format(data.date),
            yValueMapper: (BodyVitalsModel data, _) =>
            data.dia,
            color: Colors.green,
            width: 2,
            markerSettings: const MarkerSettings(
                color: Colors.green, isVisible: true),
            onPointTap: (value) {
              showDialog(
                  context: context,
                  builder: (context) {
                    BodyVitalsModel data =
                    controller.bodyVitalsModelList[
                    value.pointIndex!];
                    return AlertDialog(
                      title: Center(
                        child: Text(
                          'Record details',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium,
                        ),
                      ),
                      backgroundColor:
                      Get.find<ThemeController>()
                          .isDarkMode
                          ? Colors.grey[700]
                          : Colors.white,
                      content: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    'Date: ${DateFormat.MMMd().format(data.date)}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    'Systolic: ${data.sys} mmHg',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Text(
                                    'Diastolic: ${data.dia} mmHg',
                                    style: const TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } // ...
        ),
      ],
      onAxisLabelTapped: (args) {
        int selectedIndex = args.value.toInt() ; // Subtract 1 to get the index
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Delete Record',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              backgroundColor: Get.find<ThemeController>().isDarkMode
                  ? Colors.grey[700]
                  : Colors.white,
              content: Text(
                'Are you sure you want to delete this record?',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    String docId = controller.bodyVitalsModelList[selectedIndex].id!;
                    controller.deleteVitalsDoc(docId);
                    controller.bodyVitalsModelList.removeAt(selectedIndex);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}