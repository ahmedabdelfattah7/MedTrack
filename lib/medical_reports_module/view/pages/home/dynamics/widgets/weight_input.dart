import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/core/utils/form_fields_controllers.dart';
import 'package:medtrack/core/widgets/App_button.dart';
import 'package:medtrack/core/widgets/text_form_field.dart';
import 'package:medtrack/medical_reports_module/controller/dynamics_controller.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/dynamics/widgets/body_vitals%20_item.dart';

class WeightInput extends StatelessWidget {
  WeightInput({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DynamicsController weightController = Get.put(DynamicsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DynamicsController>(builder: (controller) {
      return GestureDetector(
        onTap: () => Get.focusScope?.unfocus(),
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 0.4,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Get.find<ThemeController>().isDarkMode
                          ? AppColors.mainDark
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Please input your today\'s weight',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            BodyVitalItem(
                              title: 'Weight',
                              unit: 'kg',
                              controller:
                                  FormFieldsControllers.weightController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a valid number';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            CustomFormField(
                              textAlign: TextAlign.center,
                              label:
                                  const Center(child: Text('Measurement date')),
                              prefixIcon: const Icon(
                                FontAwesomeIcons.calendarDays,
                              ),
                              textInputType: TextInputType.datetime,
                              onTapped: () {
                                Get.focusScope?.requestFocus(FocusNode());
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2025-05-03'),
                                ).then((value) => {
                                      FormFieldsControllers
                                              .weightDateController.text =
                                          DateFormat('dd MMM yyyy')
                                              .format(value!),
                                    });
                              },
                              width: double.infinity,
                              controller:
                                  FormFieldsControllers.weightDateController,
                              validator: (value) {},
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  controller.weightModelList.isEmpty
                      ? Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 0.2,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Get.find<ThemeController>().isDarkMode
                                ? AppColors.mainDark
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Please input height',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                BodyVitalItem(
                                  title: 'Height',
                                  unit: 'cm',
                                  controller:
                                      FormFieldsControllers.heightController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter a valid number';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  controller.weightModelList.isNotEmpty
                      ? TextButton(
                          onPressed: () {
                            controller.appearanceOfHeightWidget();
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Update Height',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  controller.isHeightUpdated
                      ? Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 0.2,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Get.find<ThemeController>().isDarkMode
                                ? AppColors.mainDark
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Please input height',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                BodyVitalItem(
                                  title: 'Height',
                                  unit: 'cm',
                                  controller:
                                      FormFieldsControllers.updateHeightController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter a valid number';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  MainButton(
                    onTabbed: () async {
                      if (_formKey.currentState!.validate()) {
                        DateTime date = DateFormat('dd MMM yyyy').parse(
                            FormFieldsControllers.weightDateController.text);
                        final dynamic heightValue =
                            controller.weightModelList.isEmpty
                                ? double.tryParse(
                                    FormFieldsControllers.heightController.text)
                                : controller.weightModelList.first.height;
                        controller.saveWeightData(
                          wight: double.parse(
                              FormFieldsControllers.weightController.text),
                          date: date,
                          height: heightValue,
                        );
                        FormFieldsControllers.weightDateController.clear();
                        FormFieldsControllers.weightController.clear();
                        FormFieldsControllers.heightController.clear();
                      }
                      final dynamic updateHeightValue =
                               double.tryParse(
                                  FormFieldsControllers.updateHeightController.text);
                      controller.isHeightUpdated?
                      controller.updateHeight(updateHeightValue): null;
                    },
                    color: Colors.blueAccent,
                    width: double.infinity,
                    height: 50,
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
