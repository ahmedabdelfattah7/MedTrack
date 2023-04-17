import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlatformButton extends StatelessWidget {
  final String? imageName;
  final String? sentence;
  final Color textColor;
  final VoidCallback? onTabbed;
  final Color buttonColor;

  const PlatformButton({
    super.key,
    required this.imageName,
    required this.textColor,
    required this.sentence,
    required this.onTabbed,
    required this.buttonColor,

  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ElevatedButton.icon(
        onPressed: onTabbed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: textColor,
            ),
          ),
        ),
        icon: Image.asset(
          imageName!,
          height: 30,
          width: 30,
        ),
        label: Text(
          sentence!,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
