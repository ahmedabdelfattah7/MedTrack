import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:medtrack/core/utils/asset_manger.dart';
import 'package:medtrack/medical_reports_module/view/widgets/home_item.dart';


class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return ConditionalBuilder(
            condition: authController.userModel != null,
            builder: (context) => Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.waving_hand,
                              color: Color(0xffE3BC9A),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Hi, ${controller.userModel?.name}'.tr,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HomeItem(
                                  onTap: () {
                                    Get.toNamed('/doctorDiagnosis');
                                  },
                                  label: 'Doctor\'s diagnosis'.tr,
                                  image: ImageManger.homeImages[0],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                HomeItem(
                                  onTap: () {
                                    Get.toNamed('/medicalHistory');
                                  },
                                  label: 'Medical History'.tr,
                                  image: ImageManger.homeImages[1],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HomeItem(
                                onTap: () {},
                                label:'Body Vitals'.tr,
                                image: ImageManger.homeImages[2],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              HomeItem(
                                onTap: () {},
                                label: 'Medical Images'.tr,
                                image: ImageManger.homeImages[3],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
