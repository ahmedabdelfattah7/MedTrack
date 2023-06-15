import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MedicalHistoryDetails extends StatelessWidget {
  const MedicalHistoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  item = Get.arguments;
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
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

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
