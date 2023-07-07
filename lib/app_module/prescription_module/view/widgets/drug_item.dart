
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medtrack/app_module/prescription_module/model/prescription_model.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:medtrack/core/utils/color_manger.dart';

class DrugItem extends StatelessWidget {
  const DrugItem({
    super.key,
    required this.item,
  });

  final PrescriptionModel item;

  @override
  Widget build(BuildContext context) {
    String _formatTime(DateTime time) {
      int hour = time.hour;
      String minute = time.minute.toString().padLeft(2, '0');
      String period = '';

      if (hour >= 12) {
        period = 'pm';
        hour -= 12;
      } else {
        period = 'am';
      }

      if (hour == 0) {
        hour = 12;
      }

      return '$hour:$minute $period';
    }
    return Container(
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
                  FontAwesomeIcons.capsules,
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
                        text: 'Drug Name '.tr,
                      ),
                      TextSpan(
                        text: ': ${item.name}',
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
                  FontAwesomeIcons.tablets,
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
                        text: 'dose'.tr,
                      ),
                      TextSpan(
                        text: ': ${item.dose}',
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
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const FaIcon(
                  FontAwesomeIcons.clock,
                  color: Colors.red,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child:RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.displayMedium,
                      children: [
                        TextSpan(
                          text: 'time '.tr,
                        ),
                        TextSpan(
                          text: ': ${_formatTime(item.time)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}