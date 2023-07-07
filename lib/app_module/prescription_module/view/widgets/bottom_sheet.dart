
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/utils/form_fields_controllers.dart';
import 'package:medtrack/core/widgets/text_form_field.dart';

class BottomSheetForDrugs extends StatelessWidget {
  const BottomSheetForDrugs({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomFormField(
                onTapped: () {
                  Get.focusScope?.requestFocus(FocusNode());
                },
                textAlign: TextAlign.start,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter the drug Name';
                  }
                  return null;
                },
                textInputType: TextInputType.text,
                controller:
                FormFieldsControllers.drugNameController,
                label: const Text('Drug Name'),
                prefixIcon: const Icon(
                  FontAwesomeIcons.pills,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                onTapped: () {
                  Get.focusScope?.requestFocus(FocusNode());
                },
                textAlign: TextAlign.start,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter the Drug Dose';
                  }
                  return null;
                },
                textInputType: TextInputType.number,
                controller:
                FormFieldsControllers.drugDoseController,
                label: const Text('Drug Dose'),
                prefixIcon: const Icon(
                  FontAwesomeIcons.pills,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                textAlign: TextAlign.center,
                label: Center(child: Text('time'.tr)),
                prefixIcon:
                const Icon(FontAwesomeIcons.clock),
                textInputType: TextInputType.datetime,
                onTapped: () {
                  Get.focusScope?.requestFocus(FocusNode());
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) {
                    if (value != null) {
                      final time = value.format(context);
                      FormFieldsControllers
                          .drugTimeController.text = time;
                    }
                  });
                },
                width: double.infinity,
                controller:
                FormFieldsControllers.drugTimeController,
                validator: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
