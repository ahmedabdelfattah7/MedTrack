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
          margin: const EdgeInsets.only(top: 16),
          width: width,
          height: 65,
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
              // errorStyle: const TextStyle(fontSize: 11),
              // //fillColor: const Color(0xffF9F9F9),
              // filled: true,
              // contentPadding: const EdgeInsets.all(20.0),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.0),
              //   borderSide: const BorderSide(
              //     color: Colors.white,
              //     width: 1.0,
              //   ),
              // ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.0),
              //   borderSide:  BorderSide(
              //     color:AppColors.border,
              //     width: 1.0,
              //   ),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.0),
              //   borderSide: BorderSide(
              //     color: AppColors.primaryColor,
              //     width: 1.0,
              //   ),
              // ),
            ),
            style:  Theme.of(context).textTheme.labelMedium,
            ),
          ),
      ],
    );
  }
}
