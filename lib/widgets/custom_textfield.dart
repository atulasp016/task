import 'package:flutter/material.dart';
import 'package:passenger_info/utils/app_color.dart';

import 'package:flutter/material.dart';
import 'package:passenger_info/utils/app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double? borderRadius; // Optional prefix icon
  final String? prefixIcon; // Optional prefix icon
  final Color? color; // Optional prefix icon
  final Color? textColor; // Optional prefix icon
  final bool isPrefixIconVisible; // Control visibility of prefix icon

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
     this.textColor = AppColor.primaryColor,
    this.color = AppColor.whiteColor,
    this.prefixIcon,
    this.isPrefixIconVisible = true, this.borderRadius = 15, // Default to visible
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: color,
          filled: true,
          hintText: hintText,
          hintStyle:  TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(16.0),
          prefixIcon: prefixIcon != null
              ? Visibility(
                  visible: isPrefixIconVisible,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: Image.asset(prefixIcon!,width: 33,height: 31,fit: BoxFit.fill),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  const CommonTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: AppColor.primaryLightColor,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                const BorderSide(width: 1, color: AppColor.primaryColor)),
        contentPadding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
