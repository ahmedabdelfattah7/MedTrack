import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';

class HomeItem extends StatelessWidget {
  final String image;
  final String label;
  final void Function()? onTap;
  const HomeItem(
      {super.key,
      required this.image,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 220,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Get.find<ThemeController>().isDarkMode
              ? AppColors.mainDark
              : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              image,
              width: double.infinity,
              height: 150,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
