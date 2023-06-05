import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medtrack/core/utils/color_manger.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    this.color,
    this.icon,
    this.onTap,
    this.row,
  }) : super(key: key);
  final Color? color;
  final String? icon;
  final VoidCallback? onTap;
 final Widget? row;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color ?? const Color(0xFF007AFF)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: row
        ),
      ),
    );
  }
}
