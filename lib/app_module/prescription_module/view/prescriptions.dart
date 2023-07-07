import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medtrack/app_module/prescription_module/controller/prescription_controller.dart';
import 'package:medtrack/app_module/prescription_module/model/prescription_model.dart';
import 'package:medtrack/app_module/prescription_module/view/widgets/bottom_sheet.dart';
import 'package:medtrack/app_module/prescription_module/view/widgets/drug_item.dart';
import 'package:medtrack/core/utils/asset_manger.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/core/utils/constants.dart';
import 'package:medtrack/core/utils/form_fields_controllers.dart';
import 'package:medtrack/core/widgets/fallback.dart';

class Prescriptions extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final prescriptionController = Get.put(PrescriptionController());

    return GetBuilder<PrescriptionController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          body: Obx(
            () => ConditionalBuilder(
              condition: prescriptionController.drugs.isNotEmpty,
              builder: (context) => Padding(
                padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                child: ListView.builder(
                    itemCount: prescriptionController.drugs.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = prescriptionController.drugs[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          background: Container(
                            height: 300,
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
                              prescriptionController.deleteDrug(item.id!);
                              prescriptionController.drugs.remove(item);
                            }
                          },
                          key: UniqueKey(),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: InkWell(
                              onTap: () {
                              },
                              child: DrugItem(item: item),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              fallback: (context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Stack(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImageManger.thereIsNoData,
                          height: 200,
                          width: 200,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Oops! No data available. Come back later or add some fresh insights',
                          style: Theme.of(context).textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              onPressed: () {
                if (controller.isBottomSheetShown) {
                  if (_formKey.currentState!.validate()) {
                    DateTime dateTime = DateFormat("h:mm a").parse(
                      FormFieldsControllers.drugTimeController.text
                          .replaceAll(".", "")
                          .trim(),
                    );
                    controller.saveDrug(
                      PrescriptionModel(
                        name: FormFieldsControllers.drugNameController.text,
                        dose: FormFieldsControllers.drugDoseController.text,
                        time: dateTime,
                        userId: userUid,
                      ),
                    );

                    FormFieldsControllers.drugNameController.clear();
                    FormFieldsControllers.drugDoseController.clear();
                    FormFieldsControllers.drugTimeController.clear();
                  }
                } else {
                  scaffoldKey.currentState
                      ?.showBottomSheet(
                        (context) => BottomSheetForDrugs(formKey: _formKey),
                        elevation: 20.0,
                      )
                      .closed
                      .then((value) {
                    controller.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit,
                    );
                  });
                  controller.changeBottomSheetState(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              },
              child: Icon(
                controller.fabIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
