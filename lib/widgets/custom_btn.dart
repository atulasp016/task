import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passenger_info/utils/app_color.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onTap;
  final double mWidth;
  final double mHeight;
  final double borderRadius;
  final String title;
  const CustomBtn(
      {super.key,
      required this.onTap,
      this.mWidth = 232,
      this.mHeight = 52,
      required this.title,
      this.borderRadius = 20});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: mWidth,
        height: mHeight,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColor.whiteColor)),
        ),
      ),
    );
  }
}
