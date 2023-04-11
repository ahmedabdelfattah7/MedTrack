import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:medtrack/authentication_module/view/shared/auth_btn.dart';
import 'package:medtrack/authentication_module/view/shared/auth_divider.dart';
import 'package:medtrack/authentication_module/view/shared/platform_btn.dart';
import 'package:medtrack/core/utils/asset_manger.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/core/utils/form_fields_controllers.dart';
import 'package:medtrack/core/utils/string_manger.dart';
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
      body: GetBuilder<AuthController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(children: [
            Lottie.asset(
              ImageManger.lottieLogo,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.loginWelcomeSentence,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppStrings.login,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                        textInputType: TextInputType.text,
                        controller: FormFieldsControllers.loginEmailController,
                        label: Text(
                          AppStrings.userEmailHint,
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
                          AppStrings.userPassWordHint,
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
                          'Sign in',
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
                            child: SocialAuthButton(
                              onPressed: () async{
                                UserCredential cred =
                                await  controller.signInWithFacebook();
                              },
                              imagePath: 'assets/images/facebook.png',
                            ),
                          ),
                         const SizedBox(width: 5,),
                          Expanded(
                            child: SocialAuthButton(
                              onPressed: () async {
                                UserCredential cred =
                                    await controller.signInWithGoogle();
                              },
                              imagePath: 'assets/images/google.png',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      HaveAccountQuestion(
                        label: AppStrings.notHavingAccount,
                        onPressed: () {
                          Get.toNamed('/signUp');
                        },
                        btnLabel: AppStrings.register,
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
