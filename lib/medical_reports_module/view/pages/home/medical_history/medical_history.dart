import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:medtrack/core/widgets/fallback.dart';
import 'package:medtrack/medical_reports_module/controllers/medical_history_controller.dart';
import 'package:medtrack/routes/routes_constants.dart';

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
                      onTap: () {
                        Get.toNamed(RouteNames.medicalHistoryDetails,
                            arguments: item,
                        );
                      },
                      child: Container(
                        width: double.infinity,
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
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    children: [
                                      TextSpan(
                                        text: 'Date '.tr,
                                      ),
                                      TextSpan(
                                        text: ': ${item.date}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
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
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    children: [
                                      TextSpan(
                                        text: 'Doctor Name '.tr,
                                      ),
                                      TextSpan(
                                        text: ': ${item.doctorName}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
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
                                  child: RichText(
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      children: [
                                        TextSpan(
                                          text: 'complain '.tr,
                                        ),
                                        TextSpan(
                                          text: ': ${item.complain}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    overflow: TextOverflow.clip,
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
                                  child: RichText(
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      children: [
                                        TextSpan(
                                          text: 'Doctor Diagnosis '.tr,
                                        ),
                                        TextSpan(
                                          text: ': ${item.diagnosis}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
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
              Get.offNamed(RouteNames.doctorDiagnosis);
            },
          ),
        ),
      ),
    );
  }
}
