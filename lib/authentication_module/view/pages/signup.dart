
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:medtrack/authentication_module/view/shared/auth_divider.dart';
import 'package:medtrack/authentication_module/view/shared/social_widget.dart';
import 'package:medtrack/core/utils/asset_manger.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/core/utils/enums.dart';
import 'package:medtrack/core/utils/form_fields_controllers.dart';
import 'package:medtrack/core/utils/styles.dart';
import 'package:medtrack/core/widgets/App_button.dart';
import 'package:medtrack/core/widgets/text_form_field.dart';

class SignUp extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SvgPicture.asset(
                      ImageManger.signUpImage,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'signUpWelcomeSentence'.tr,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'signUp'.tr,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormField(
                            textAlign: TextAlign.start,
                            textInputType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Name';
                              }
                              return null;
                            },
                            controller:
                                FormFieldsControllers.signUpNameController,
                            label: Text(
                              'userNameHint'.tr,
                              style: AppTextStyles.textFormField,
                            ),
                            prefixIcon: const Icon(
                              FontAwesomeIcons.user,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormField(
                            textAlign: TextAlign.start,
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Email';
                              }
                              return null;
                            },
                            controller:
                                FormFieldsControllers.signUpEmailController,
                            label: Text(
                              'userEmailHint'.tr,
                              style: AppTextStyles.textFormField,
                            ),
                            prefixIcon: const Icon(
                              FontAwesomeIcons.envelope,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormField(
                            textAlign: TextAlign.start,
                            textInputType: TextInputType.text,
                            obscureText: controller.isPasswordSignUp,
                            controller:
                                FormFieldsControllers.signUpPasswordController,
                            label: Text(
                              'userPassWordHint'.tr,
                              style: AppTextStyles.textFormField,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Password';
                              }
                              if (value.length <= 8) {
                                return 'password is too short';
                              }
                              return null;
                            },
                            prefixIcon: const Icon(
                              FontAwesomeIcons.lock,
                            ),
                            suffixPressed: () {
                              controller.changePasswordVisibilitySignUp();
                            },
                            suffixIcon: controller.isPasswordSignUp
                                ? FontAwesomeIcons.eyeSlash
                                : FontAwesomeIcons.eye,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MainButton(
                            onTabbed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.register(
                                    userName: FormFieldsControllers
                                        .signUpNameController.text
                                        .trim(),
                                    emailAddress: FormFieldsControllers
                                        .signUpEmailController.text
                                        .trim(),
                                    password: FormFieldsControllers
                                        .signUpPasswordController.text
                                        .trim());
                              }

                              FormFieldsControllers.signUpNameController
                                  .clear();
                              FormFieldsControllers.signUpEmailController
                                  .clear();
                              FormFieldsControllers.signUpPasswordController
                                  .clear();
                            },
                            color: AppColors.primaryColor,
                            width: double.infinity,
                            height: 50,
                            child: Obx(() {
                              if (controller.requestState.value ==
                                  RequestState.loading) {
                                return const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                );
                              } else {
                                return Text(
                                  'signUp'.tr,
                                  style: AppTextStyles.button,
                                );
                              }
                            }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const AuthDivider(),
                          SocialLoginWidget(),
                          HaveAccountQuestion(
                            label: 'alreadyHaveAccount'.tr,
                            onPressed: () {
                              Get.toNamed('/login');
                            },
                            btnLabel: 'signIn'.tr,
                          ),
                        ]),
                  ),
                ),
              ]),
            );
          }),
    );
  }
}
