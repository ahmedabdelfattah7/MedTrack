import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/authentication_module/controller/auth_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    debugPrint('This is userName :${controller.userModel?.name}');
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetBuilder<AuthController>(builder: (controller) {
            return ElevatedButton(
                onPressed: () {
                  controller.signOut();
                },
                child: Text('Sign out from ${controller.userModel?.email}'));
          }),
        ],
      ),
    );
  }
}
