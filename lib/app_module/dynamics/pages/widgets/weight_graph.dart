import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/app_module/dynamics/controller/dynamics_controller.dart';
import 'package:medtrack/app_module/dynamics/model/weight_model.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
class WeightGraph extends StatelessWidget {
  const WeightGraph({
    super.key,
    required this.controller,
  });

  final DynamicsController controller;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(
        text: 'weight'.tr,
        textStyle: Theme.of(context).textTheme.displayMedium,
      ),
      legend: Legend(
        isVisible: true,
        textStyle:
        Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16),
      ),
      primaryXAxis: CategoryAxis(
        labelStyle:
        Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16),
        majorGridLines: const MajorGridLines(width: 2),
        labelRotation: 300,
        arrangeByIndex: false,
      ),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}\n kg',
        minimum: 40,
        maximum: 200,
        interval: 20,
        labelStyle: Theme.of(context).textTheme.displayMedium,
        majorGridLines: const MajorGridLines(width: 2),
        minorGridLines: const MinorGridLines(width: 1),
        axisLine: const AxisLine(width: 2),
      ),
      series: <LineSeries<WeightModel, String>>[
        LineSeries<WeightModel, String>(
            name: 'weight'.tr,
            dataSource: controller.weightModelList,
            xValueMapper: (WeightModel data, _) =>
                DateFormat.MMMd().format(data.date),
            yValueMapper: (WeightModel data, _) => data.weight,
            color: Colors.red,
            width: 2,
            markerSettings:
            const MarkerSettings(color: Colors.red, isVisible: true),
            onPointTap: (value) {
              showDialog(
                  context: context,
                  builder: (context) {
                    WeightModel data =
                    controller.weightModelList[value.pointIndex!];
                    return AlertDialog(
                      title: Center(
                        child: Text(
                          'Record details',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      backgroundColor: Get.find<ThemeController>().isDarkMode
                          ? Colors.grey[700]
                          : Colors.white,
                      content: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'weight: ${data.weight} kg',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
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
      ],
      onAxisLabelTapped: (args) {
        int selectedIndex = args.value.toInt(); // Subtract 1 to get the index
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
                    String docId =
                    controller.weightModelList[selectedIndex].id!;
                    controller.deleteWeightDoc(docId);
                    controller.weightModelList.removeAt(selectedIndex);
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