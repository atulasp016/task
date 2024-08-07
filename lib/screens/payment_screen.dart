import 'package:flutter/material.dart';
import 'package:passenger_info/utils/app_color.dart';
import 'package:passenger_info/utils/app_image.dart';
import 'package:passenger_info/utils/ui_helper.dart';
import 'package:passenger_info/widgets/custom_btn.dart';
import 'package:passenger_info/widgets/custom_textfield.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var couponController = TextEditingController();
  String? selectedProfile;
  bool isCheckedGst = false;
  bool isCheckedFlight = false;

  void selectProfile(String profile) {
    setState(() {
      selectedProfile = profile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: 71,
                  padding: const EdgeInsets.all(15),
                  color: AppColor.blackColor,
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 46,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColor.primaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 0.5,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        child: Image.asset(
                          AppImage.IC_CONTACT,
                          width: 30,
                          height: 30,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Image.asset(
                            'assets/icons/img.png',
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 45,
                        height: 46,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          AppImage.IC_PAYMENT,
                          width: 30,
                          height: 30,
                          color: AppColor.primaryLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 21),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomTextField(
                        borderRadius: 38,
                        textColor: AppColor.whiteColor,
                        color: AppColor.blackLightColor,
                        controller: couponController,
                        hintText: 'Coupon Code',
                        prefixIcon: AppImage.IC_COUPON,
                      ),
                    ),
                    const SizedBox(width: 21),
                    Expanded(
                      flex: 2,
                      child: CustomBtn(
                        borderRadius: 38,
                        onTap: () {},
                        title: 'Apply',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 21),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.blackLightColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: List.generate(getTitleList.length, (index) {
                          return getTitleText(
                            textColor2: AppColor.whiteColor,
                            title: getTitleList[index]['title'].toString(),
                            subTitle:
                            getTitleList[index]['subtitle'].toString(),
                          );
                        }).toList(),
                      ),
                      const Text(
                        'Fare Breakup :',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColor.redColor,
                          fontSize: 16,
                        ),
                      ),
                      Column(
                        children:
                        List.generate(getSubtitleList.length, (index) {
                          return getSubtitleText(
                            textColor1: AppColor.whiteColor,
                            textColor2: AppColor.whiteColor,
                            title: getSubtitleList[index]['title'].toString(),
                            subTitle:
                            getSubtitleList[index]['subtitle'].toString(),
                          );
                        }).toList(),
                      ),
                      getSubtitleText(
                        title: 'Applied Coupon Discount',
                        subTitle: 'Rs. 300/-',
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          color: AppColor.whiteColor,
                          height: 1,
                        ),
                      ),
                      getTitleText(
                        title: 'Total :',
                        subTitle: 'Rs. 3165/-',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 21),
                Container(
                  height: 152,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.blackLightColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: selectBoxCon(
                              onTap: () => selectProfile('Rs. 0'),
                              title: 'Rs. 0',
                              couponCode: '0%',
                              isSelected: selectedProfile == 'Rs. 0',
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: selectBoxCon(
                              onTap: () => selectProfile('Rs. 866.25'),
                              title: 'Rs. 866.25',
                              couponCode: '25%',
                              isSelected: selectedProfile == 'Rs. 866.25',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: selectBoxCon(
                              onTap: () => selectProfile('Rs. 1732.5'),
                              title: 'Rs. 1732.5',
                              couponCode: '50%',
                              isSelected: selectedProfile == 'Rs. 1732.5',
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: selectBoxCon(
                              onTap: () => selectProfile('Rs. 3165'),
                              title: 'Rs. 3165',
                              couponCode: '100%',
                              isSelected: selectedProfile == 'Rs. 3165',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 21),
                CustomBtn(
                  onTap: () {},
                  title: 'Pay Now',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}