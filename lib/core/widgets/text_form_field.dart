import 'package:flutter/material.dart';


class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  String? hintText;
  final bool isPhone;
  bool obscureText = false;
  VoidCallback? suffixPressed;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final double? width;
  VoidCallback? onTapped;
  String? Function(String?)? validator;
  String? Function(String?)? onChanged;
  final Widget? widget;
  final Widget? label;
  final bool isDropDown;
  final List<String>? items;
  final TextStyle? style;
  int? maxLines;
  CustomFormField({
    super.key,
    required this.controller,
    this.label,
    this.maxLines,
    this.suffixPressed,
    required this.textInputType,
    this.hintText,
    this.isPhone = false,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.width,
    this.onTapped,
    this.widget,
    this.isDropDown = false,
    this.items,
    this.style,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: width,
          height: 65,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            onTap: onTapped,
            obscureText: obscureText,
            onFieldSubmitted: (value) {},
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              label: label,
              hintText: hintText,
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      onPressed: suffixPressed,
                      icon: Icon(
                        suffixIcon,
                      ),
                    )
                  : null,
            ),
            style:  Theme.of(context).textTheme.displayMedium,
            ),
          ),
      ],
    );
  }
}
