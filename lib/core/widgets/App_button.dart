import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onTabbed;
  final Widget? child;
  final Color? color;

  final double? width;
  final double? height;

  const MainButton(
      {super.key,
      required this.onTabbed,
      required this.child,
      required this.color,
        required this.width,
        required this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTabbed,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
