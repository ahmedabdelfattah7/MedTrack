import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';
import 'package:medtrack/authentication_module/view/shared/platform_btn.dart';
import 'package:medtrack/core/utils/asset_manger.dart';
import 'package:medtrack/core/utils/enums.dart';

class SocialLoginWidget extends StatelessWidget {
  SocialLoginWidget({
    super.key,
  });
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Obx(
              () => Center(
                child: SocialLoginButton(
                  onTap: () async {
                    await controller.signInWithFacebook();
                  },
                  row: controller.facebookRequestState.value ==
                          RequestState.loading
                      ? const Center(
                        child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                      )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageManger.facebookLogo,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'facebookSentence'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                ),
              ),
            )),
        const SizedBox(
          width:5,
        ),
        Expanded(
            flex: 1,
            child:Obx(
    () => Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 18,
                  offset: const Offset(0, 8), // changes position of shadow
                ),
              ]),
              child: Center(
                child: SocialLoginButton(
                  onTap: () async {
                    await controller.signInWithGoogle();
                  },
                  color: Colors.white,
                  row: controller.googleRequestState.value == RequestState.loading
                      ? const Center(
                        child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                      )
                      : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              ImageManger.googleLogo,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'googleSentence'.tr,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                ),
              ),
            )),
        ),
      ],
    );
  }
}
