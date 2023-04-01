import 'package:flutter/material.dart';
import 'package:medtrack/core/utils/color_manger.dart';

class PlatformButton extends StatelessWidget {
  final String? imageName;
  final String? label;
  final VoidCallback? onTabbed;
  final Color buttonColor;
  final Color labelColor;
  const PlatformButton({
    super.key,
    required this.imageName,
    required this.label,
    required this.onTabbed,
    required this.buttonColor,
    required this.labelColor,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTabbed,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: buttonColor,
            border: Border.all(color: AppColors.primaryColor)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('$imageName'),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '$label',
                style: TextStyle(
                  fontSize: 18,
                  color: labelColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
