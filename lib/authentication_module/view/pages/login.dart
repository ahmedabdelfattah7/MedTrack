import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
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
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              ImageManger.logo,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                AppStrings.loginWelcomeSentence,
                style: AppTextStyles.hint,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.login,
                style: AppTextStyles.bigText,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                textInputType: TextInputType.text,
                controller: FormFieldsControllers.loginNameController,
                label: Text(
                  AppStrings.userNameHint,
                  style:AppTextStyles.textFormField,
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
              GetBuilder<AuthController>(
                  init: AuthController(),
                  builder: (controller) {
                    return CustomFormField(
                      textInputType: TextInputType.text,
                      obscureText: controller.isPassword,
                      controller: FormFieldsControllers.loginPasswordController,
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
                        controller.changePasswordVisibility();
                      },
                      suffixIcon: controller.isPassword
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              MainButton(
                onTabbed: () {},
                color: AppColors.primaryColor,
                style:  Text(
                  'Sign in',
                  style:AppTextStyles.button,
                ),
                width: double.infinity,
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              const AuthDivider(),
              PlatformButton(
                buttonColor: AppColors.white,
                labelColor: AppColors.black,
                imageName: ImageManger.googleLogo,
                onTabbed: () {},
                label: AppStrings.loginWithGoogle,
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
        ]),
      ),
    );
  }
}
