import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:medtrack/authentication_module/view/shared/auth_divider.dart';
import 'package:medtrack/authentication_module/view/shared/platform_btn.dart';
import 'package:medtrack/core/utils/asset_manger.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/core/utils/form_fields_controllers.dart';
import 'package:medtrack/core/utils/styles.dart';
import 'package:medtrack/core/widgets/App_button.dart';
import 'package:medtrack/core/widgets/text_form_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final AuthController controller = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>
        (builder: (controller) {
        return SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SvgPicture.asset(
                ImageManger.loginImage,
                height: 250,
                fit: BoxFit.cover,
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
                        'loginWelcomeSentence'.tr,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'login'.tr,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                        textInputType: TextInputType.text,
                        controller: FormFieldsControllers.loginEmailController,
                        label: Text(
                          'userEmailHint'.tr,
                          style: AppTextStyles.textFormField,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Email';
                          }
                          return null;
                        },
                        prefixIcon: const Icon(
                          FontAwesomeIcons.envelope,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                        textInputType: TextInputType.text,
                        obscureText: controller.isPasswordLogin,
                        controller:
                            FormFieldsControllers.loginPasswordController,
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
                          controller.changePasswordVisibilityLogin();
                        },
                        suffixIcon: controller.isPasswordLogin
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MainButton(
                        onTabbed: () async {
                          if (_formKey.currentState!.validate()) {
                            controller.signIn(
                                emailAddress: FormFieldsControllers
                                    .loginEmailController.text
                                    .trim(),
                                password: FormFieldsControllers
                                    .loginPasswordController.text
                                    .trim());
                          }
                          FormFieldsControllers.loginEmailController.clear();
                          FormFieldsControllers.loginPasswordController.clear();
                        },
                        color: AppColors.primaryColor,
                        style: Text(
                          'login'.tr,
                          style: AppTextStyles.button,
                        ),
                        width: double.infinity,
                        height: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const AuthDivider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: PlatformButton(
                              onTabbed: () async {
                                UserCredential cred =
                                    await controller.signInWithFacebook();
                              },
                              imageName: ImageManger.facebookLogo,
                              buttonColor: Colors.white,
                              textColor: AppColors.faceBookColor,
                              sentence:'facebookSentence'.tr,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: PlatformButton(
                              onTabbed: () async {
                                UserCredential cred =
                                    await controller.signInWithGoogle();
                              },
                              imageName: ImageManger.googleLogo,
                              buttonColor: Colors.white,
                              textColor: AppColors.faceBookColor,
                              sentence:  'googleSentence'.tr,
                            ),
                          ),
                        ],
                      ),
                      HaveAccountQuestion(
                        label:  'notHavingAccount'.tr,
                        onPressed: () {
                          Get.toNamed('/signUp');
                        },
                        btnLabel:'register'.tr,
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
