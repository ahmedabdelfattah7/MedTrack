import 'package:flutter/material.dart';
import 'package:medtrack/core/utils/color_manger.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  String? hintText;
  final bool isPhone;
  bool obscureText=false;
  VoidCallback?  suffixPressed;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final double? width;
  VoidCallback? onTapped;
  String? Function(String?)? validator;
  final Widget? widget;
  final Widget? label;
  final bool isDropDown;
  final List<String>? items;
  final TextStyle? style;
  CustomFormField({
    super.key,
    required this.controller,
    this.label,
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
          margin: const EdgeInsets.only(top: 8),
          width: width,
          height: 50,
          child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            onTap: onTapped,
            obscureText: obscureText,
            onFieldSubmitted: (value) {},
            onChanged: (value) {},
            validator: validator,
            decoration: InputDecoration(
              fillColor: const Color(0xffF9F9F9),
              filled: true,
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
              contentPadding: const EdgeInsets.all(20.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
