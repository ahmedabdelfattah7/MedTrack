import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/app_module/dynamics/controller/dynamics_controller.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:medtrack/core/utils/color_manger.dart';

class WeightAnalytics extends StatelessWidget {
  const WeightAnalytics({
    super.key,
    required this.controller,
    required this.interpretation,
  });

  final DynamicsController controller;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return DataTable(

      decoration:  BoxDecoration(
          border: Border.all(
            width: 1,
            color:Get.find<ThemeController>().isDarkMode
                ? Colors.white
                :  AppColors.mainDark,
          )),
      columns: <DataColumn>[
        DataColumn(

          label: Text(
            'Label',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          numeric: false,
        ),
        DataColumn(
          label: Text(
            'Value',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          numeric: false,
        ),
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(
              Text(
                ' Your Weight',
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            DataCell(
              Text(
                '${controller.weightModelList.first.weight} Kg',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(
              Text(
                'Your Height',
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            DataCell(
              Text(
                '${controller.weightModelList.last.height!} Cm',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(
              Text(
                'Your Bmi Weight',
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            DataCell(
              Text(
                '${controller.calculateBMI(controller.weightModelList.last.height!, controller.weightModelList.first.weight)} Kg',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(
              Text(
                'Helthiness',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            DataCell(
              Text(
                interpretation,
                textAlign: TextAlign.left,
                style: interpretation == 'Normal'
                    ? const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )
                    : const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
              ),
            ),
          ],
        ),
        // Add more rows as needed
      ],
    );
  }
}
