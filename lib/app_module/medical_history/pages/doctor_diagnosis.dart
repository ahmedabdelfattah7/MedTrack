import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medtrack/app_module/medical_history/controller/medical_history_controller.dart';
import 'package:medtrack/core/utils/asset_manger.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/core/utils/form_fields_controllers.dart';
import 'package:medtrack/core/widgets/App_button.dart';
import 'package:medtrack/core/widgets/text_form_field.dart';

import 'package:medtrack/core/Themes/theme_controller.dart';


// ignore: must_be_immutable
class DoctorDiagnosis extends StatelessWidget {
  DoctorDiagnosis({Key? key}) : super(key: key);
  MedicalHistoryController medicalHistoryController =
      Get.put(MedicalHistoryController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicalHistoryController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'welcome input'.tr,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        body: GestureDetector(
          onTap: () => Get.focusScope?.unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SvgPicture.asset(
                        ImageManger.diagnosis,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormField(
                            onTapped: () {
                              Get.focusScope?.requestFocus(FocusNode());
                            },
                            textAlign: TextAlign.start,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter the doctor Name';
                              }
                              return null;
                            },
                            textInputType: TextInputType.text,
                            controller:
                                FormFieldsControllers.doctorNameController,
                            label: const Text('Doctor Name'),
                            prefixIcon: const Icon(
                              FontAwesomeIcons.person,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomFormField(
                            textAlign: TextAlign.start,
                            label:
                                Text(DateFormat.yMMMd().format(DateTime.now())),
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
                                    FormFieldsControllers.dateController.text =
                                        DateFormat.yMMMd().format(value!)
                                  });
                            },
                            width: double.infinity,
                            controller: FormFieldsControllers.dateController,
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      onTapped: () {
                        Get.focusScope?.requestFocus(FocusNode());
                      },
                      textAlign: TextAlign.start,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the your Complain';
                        }
                        return null;
                      },
                      textInputType: TextInputType.text,
                      controller: FormFieldsControllers.complainController,
                      label: const Text('Complain'),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.faceSadCry,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        onTap: () {
                          Get.focusScope?.requestFocus(FocusNode());
                        },
                        textAlign: TextAlign.start,
                        maxLines: null,
                        controller: FormFieldsControllers.diagnosisController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            FontAwesomeIcons.houseChimneyMedical,
                          ),
                          labelText: 'Doctor Diagnosis',
                          filled: true,
                          fillColor: Get.find<ThemeController>().isDarkMode
                              ? AppColors.mainDark
                              : Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.all(20.0),
                        ),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MainButton(
                      onTabbed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.saveData(
                              complain: FormFieldsControllers
                                  .complainController.text
                                  .trim(),
                              date: FormFieldsControllers
                                      .dateController.text.isEmpty
                                  ? DateFormat.yMMMd().format(DateTime.now())
                                  : FormFieldsControllers.dateController.text
                                      .trim(),
                              doctorName: FormFieldsControllers
                                  .doctorNameController.text
                                  .trim(),
                              diagnosis: FormFieldsControllers
                                  .diagnosisController.text
                                  .trim());
                          FormFieldsControllers.complainController.clear();
                          FormFieldsControllers.dateController.clear();
                          FormFieldsControllers.doctorNameController.clear();
                          FormFieldsControllers.diagnosisController.clear();
                        }
                      },
                      color: Colors.blueAccent,
                      width: double.infinity,
                      height: 50,
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
