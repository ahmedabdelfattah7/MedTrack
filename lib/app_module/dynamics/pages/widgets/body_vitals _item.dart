import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/widgets/text_form_field.dart';

class BodyVitalItem extends StatelessWidget {
  final String title;
  final String? unit;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const BodyVitalItem(
      {super.key,
        required this.title,
         this.unit,
        required this.controller,
        required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                unit != null ?
                Text(
                  unit!,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ) : const SizedBox.shrink()
              ],
            ),
          ),
          const SizedBox(width:10,),
          Expanded(
            flex: 1,
            child: CustomFormField(
              onTapped: () => Get.focusScope?.unfocus(),
              textAlign: TextAlign.center,
              width: double.infinity,
              controller:controller,
              textInputType: TextInputType.number,
              validator: validator,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}