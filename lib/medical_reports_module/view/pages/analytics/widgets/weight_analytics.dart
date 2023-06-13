import 'package:flutter/material.dart';
import 'package:medtrack/medical_reports_module/controller/dynamics_controller.dart';

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
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Label',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          numeric: false,
        ),
        DataColumn(
          label: Text(
            'Value',
            textAlign: TextAlign.left,
            style: TextStyle(
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
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            DataCell(
              Text(
                '${controller.weightModelList.first
                    .weight} Kg',
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
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            DataCell(
              Text(
                '${controller.weightModelList.last
                    .height!} Cm',
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
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            DataCell(
              Text(
                '${controller.calculateBMI(
                    controller.weightModelList.last
                        .height!,
                    controller.weightModelList.first
                        .weight)} Kg',
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
                'Bmi Range Interpretation',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            DataCell(
              Text(
                interpretation,
                textAlign: TextAlign.left,
                style: interpretation == 'Normal'? const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  fontSize: 18,
                ):  const TextStyle(
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