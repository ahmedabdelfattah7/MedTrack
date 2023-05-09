import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/utils/asset_manger.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/medical_reports_module/controller/medical_history_controller.dart';
import 'package:medtrack/medical_reports_module/controller/theme_controller.dart';
import 'package:medtrack/medical_reports_module/view/widgets/fallback.dart';

class MedicalHistory extends StatelessWidget {
  MedicalHistory({Key? key}) : super(key: key);
  final MedicalHistoryController medicalHistoryController =
      Get.put(MedicalHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => ConditionalBuilder(
          condition: medicalHistoryController.medicalHistoryList.isNotEmpty,
          builder: (context) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = medicalHistoryController.medicalHistoryList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    width: double.infinity,
                    height: 200,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 180),
                        child: Icon(Icons.delete),
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) => showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                              title: const Text('Please Confirm'),
                              content: const Text(
                                  'Are you sure you want to delete?'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop(false);
                                    },
                                    child: const Text('Cancel')),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .red, // Set the background color to red
                                    ),
                                    onPressed: () {
                                      Navigator.of(ctx).pop(true);
                                    },
                                    child: const Text('Confirm')),
                              ])),
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart) {
                      medicalHistoryController.deleteDoc(item.id!);
                      medicalHistoryController.medicalHistoryList.remove(item);
                    }
                  },
                  key: Key(item.id![index]),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 210,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Get.find<ThemeController>().isDarkMode
                              ? AppColors.mainDark
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.calendarDays,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Date: ${item.date}',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.userDoctor,
                                  color: Colors.green,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Doctor Name:${item.doctorName}',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.bookMedical,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'complain: ${item.complain}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.fileWaveform,
                                  color: Colors.orange,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'diagnosis: ${item.diagnosis}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: medicalHistoryController.medicalHistoryList.length,
          ),
          fallback: (context) => FallBack(
            onPressed: () {
              Get.offNamed('/doctorDiagnosis');
            },
          ),
        ),
      ),
    );
  }
}
