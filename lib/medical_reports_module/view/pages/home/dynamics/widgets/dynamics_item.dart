import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';

class DynamicsItems extends StatelessWidget {
  DynamicsItems({
    super.key,
    required  this.onTap,
    required this.icon,
  required this.label,
  });
  void Function()? onTap;
  Widget icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color:Get.find<ThemeController>().isDarkMode
              ? AppColors.mainDark
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
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
          child: Row(
            children:  [
              icon,
              const SizedBox(width: 20,),
              Text(
              label,
                style:Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, color: Get.find<ThemeController>().isDarkMode
                  ? AppColors.white
                  : Colors.black,
                size: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}