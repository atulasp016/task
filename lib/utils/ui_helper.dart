import 'package:flutter/material.dart';
import 'package:passenger_info/utils/app_color.dart';
import 'package:passenger_info/widgets/custom_textfield.dart';

List getTitleList = [
  {'title': 'Trip Type', 'subtitle': 'Outstation - Round Trip'},
  {'title': 'Travel Date', 'subtitle': '15-12-2023 to 16-12-2023'},
  {'title': 'Pickup Time', 'subtitle': '21:00'},
  {'title': 'No. of Days', 'subtitle': '2 Days'},
];

List getSubtitleList = [
  {'title': 'Approx Roundtrip Distance :', 'subtitle': '300 Kms.'},
  {'title': 'Min Km Charged :', 'subtitle': '250 Kms/day'},
  {
    'title': 'Approx Roundtrip Charge :\n(300 KM X Rs.10/km )',
    'subtitle': 'Rs. 3000/-'
  },
  {'title': 'Driver Allowance :\n(Rs.300 X 1 Day)', 'subtitle': 'Rs. 300/-'},
  {'title': 'GST :\n(5 % GST on Rs. 3300)', 'subtitle': 'Rs. 165/-'},
];



Widget getSubtitleText({
  required String title,
  required String subTitle,
  Color textColor1 = AppColor.primaryColor,
  Color textColor2 = AppColor.primaryColor,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: textColor1,
            fontSize: 12,
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: textColor2,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

Widget getTitleText({
  required String title,
  required String subTitle,
  Color textColor1 = AppColor.primaryColor,
  Color textColor2 = AppColor.primaryColor,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: textColor1,
            fontSize: 15,
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: textColor2,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

Widget selectBoxCon({
  required VoidCallback onTap,
  required String title,
  required String couponCode,
  required bool isSelected,
}) {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap,
              child: CircleAvatar(
                radius: 12.5,
                backgroundColor:
                isSelected ? AppColor.primaryColor : AppColor.greyColor,
                child: CircleAvatar(
                  radius: 11,
                  backgroundColor: AppColor.whiteColor,
                  child: CircleAvatar(
                    radius: 8.5,
                    backgroundColor: isSelected
                        ? AppColor.primaryColor
                        : AppColor.greyColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColor.whiteColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      const Spacer(),
      Container(
        height: 25,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: AppColor.primaryLightColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.5,
            color: AppColor.primaryColor,
          ),
        ),
        child: Center(
          child: Text(
            couponCode,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColor.primaryColor,
              fontSize: 15,
            ),
          ),
        ),
      ),
    ],
  );
}


Widget checkBoxCon({
  required void Function(bool?) onTap,
  required TextEditingController controller,
  required String title,
  required bool isChecked, // Added this parameter
}) {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: isChecked,
              fillColor: isChecked
                  ? WidgetStateProperty.all(AppColor.primaryColor)
                  : WidgetStateProperty.all(AppColor.whiteColor),
              side: WidgetStateBorderSide.resolveWith(
                      (states) => BorderSide.none), // Remove border

              onChanged: onTap,
              activeColor:
              AppColor.primaryColor, // Optional: color when checked
              checkColor:
              AppColor.whiteColor, // Optional: color of the checkmark
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColor.primaryColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(width: 16),
      Expanded(flex: 5, child: CommonTextField(controller: controller))
    ],
  );
}

Widget selectContactContainer({
  required VoidCallback onTap,
  required String iconImage,
  required String title,
  required bool isSelected,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 12.5,
          backgroundColor:
          isSelected ? AppColor.primaryColor : AppColor.greyColor,
          child: CircleAvatar(
            radius: 11,
            backgroundColor: AppColor.whiteColor,
            child: CircleAvatar(
              radius: 8.5,
              backgroundColor:
              isSelected ? AppColor.primaryColor : AppColor.greyColor,
            ),
          ),
        ),
        const SizedBox(width: 21),
        Image.asset(iconImage, width: 30, height: 30, fit: BoxFit.fill),
        const SizedBox(width: 31),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: isSelected ? AppColor.redColor : AppColor.whiteColor,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
