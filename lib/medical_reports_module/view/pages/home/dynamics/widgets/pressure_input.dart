import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/core/utils/form_fields_controllers.dart';
import 'package:medtrack/core/widgets/App_button.dart';
import 'package:medtrack/core/widgets/text_form_field.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:medtrack/medical_reports_module/controllers/dynamics_controller.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/dynamics/widgets/body_vitals%20_item.dart';

class VitalsInput extends StatelessWidget {
   VitalsInput({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DynamicsController bodyVitalsController = Get.put(DynamicsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DynamicsController>(builder: (controller) {
      return GestureDetector(
        onTap:(){
            Get.focusScope?.unfocus();
        } ,
        child: Scaffold(
          appBar: AppBar(
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add the new measurements'.tr,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 0.6,
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
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'pressure'.tr,
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              BodyVitalItem(
                                title: 'sys'.tr,
                                unit: 'mmhg'.tr,
                                controller: FormFieldsControllers.sysController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a value\n between 50 and 220';
                                  }
                                  final number = num.tryParse(value);
                                  if (number == null) {
                                    return 'Enter a valid number';
                                  }
                                  if (number < 50 || number > 220) {
                                    return 'Enter a value between 50 and 220';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BodyVitalItem(
                                title: 'dia'.tr,
                                unit: 'mmhg'.tr,
                                controller: FormFieldsControllers.daiController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a value\n between 35 and 160';
                                  }
                                  final number = num.tryParse(value);
                                  if (number == null) {
                                    return 'Enter a valid number';
                                  }
                                  if (number < 35 || number > 160) {
                                    return 'Enter a value between 35 and 160';
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
                              const SizedBox(
                                height: 5,
                              ),
                              BodyVitalItem(
                                title: 'pulse'.tr,
                                controller: FormFieldsControllers.pulseController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a value\n between 40 and 160';
                                  }
                                  final number = num.tryParse(value);
                                  if (number == null) {
                                    return 'Enter a valid number';
                                  }
                                  if (number < 40 || number > 160) {
                                    return 'Enter a value between 40 and 160';
                                  }
                                  return null;
                                },
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomFormField(

                                      textAlign: TextAlign.center,
                                      label:  Center(
                                          child: Text('Measurement date'.tr)),
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
                                              .dateVitalController.text =
                                              DateFormat('dd MMM yyyy')
                                                  .format(value!),
                                        });
                                      },
                                      width: double.infinity,
                                      controller:
                                      FormFieldsControllers.dateVitalController,
                                      validator: (value) {},
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
                  const SizedBox(
                    height: 20,
                  ),
                  MainButton(
                    onTabbed: () {
                      if (_formKey.currentState!.validate()) {
                        DateTime date = DateFormat('dd MMM yyyy').parse(
                            FormFieldsControllers.dateVitalController.text);
                        controller.saveVitalsData(
                          sys: int.parse(
                              FormFieldsControllers.sysController.text.trim()),
                          dia: int.parse(
                              FormFieldsControllers.daiController.text.trim()),
                          pulse: int.parse(
                              FormFieldsControllers.pulseController.text.trim()),
                          date: date,
                        );
                        FormFieldsControllers.sysController.clear();
                        FormFieldsControllers.daiController.clear();
                        FormFieldsControllers.pulseController.clear();
                      }
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
