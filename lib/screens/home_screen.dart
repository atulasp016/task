import 'package:flutter/material.dart';
import 'package:passenger_info/screens/payment_screen.dart';
import 'package:passenger_info/utils/app_color.dart';
import 'package:passenger_info/utils/app_image.dart';
import 'package:passenger_info/utils/ui_helper.dart';
import 'package:passenger_info/widgets/custom_btn.dart';
import 'package:passenger_info/widgets/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nameController = TextEditingController();
  var numberController = TextEditingController();
  var addressController = TextEditingController();
  var instructionController = TextEditingController();
  var gstController = TextEditingController();
  var flightController = TextEditingController();
  String? selectedProfile;
  bool isCheckedGst = false;
  bool isCheckedFlight = false;

  void selectProfile(String profile) {
    selectedProfile = profile;
    setState(() {});
  }

  void toggleCheckboxGst(bool? newValue) {
    setState(() {
      isCheckedGst = newValue ?? false;
    });
  }

  void toggleCheckboxFlight(bool? newValue) {
    setState(() {
      isCheckedFlight = newValue ?? false;
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
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(AppImage.IC_CONTACT,
                              width: 30,
                              height: 30,
                              color: AppColor.primaryLightColor),
                        ),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image.asset('assets/icons/img.png',
                                  color: AppColor.whiteColor),
                            )),
                        Container(
                          width: 45,
                          height: 46,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: AppColor.primaryLightColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.5, color: AppColor.primaryColor)),
                          child: Image.asset(AppImage.IC_PAYMENT,
                              width: 30,
                              height: 30,
                              color: AppColor.primaryColor),
                        ),
                      ],
                    )),
                const SizedBox(height: 21),
                Container(
                  height: 152,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.blackLightColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Contact Number -',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColor.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                      selectContactContainer(
                          onTap: () => selectProfile('mySelf'),
                          iconImage: AppImage.IC_CONTACT,
                          title: 'My Self',
                          isSelected: selectedProfile == 'mySelf'),
                      selectContactContainer(
                          onTap: () => selectProfile('forOthers'),
                          iconImage: AppImage.IC_CONTACT_OTHER,
                          title: 'For Others',
                          isSelected: selectedProfile == 'forOthers'),
                    ],
                  ),
                ),
                const SizedBox(height: 21),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.blackLightColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pickup Details -',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColor.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 21),
                      CustomTextField(
                          controller: nameController,
                          hintText: 'Passenger Name'),
                      CustomTextField(
                          controller: numberController,
                          hintText: 'Mobile Number'),
                      CustomTextField(
                          controller: addressController,
                          hintText: 'Pick Up Address'),
                      CustomTextField(
                          controller: instructionController,
                          hintText: 'Comment if Any Instruction for driver'),
                      const SizedBox(height: 21),
                      checkBoxCon(
                        controller: flightController,
                        title: 'GST',
                        isChecked: isCheckedGst,
                        onTap: toggleCheckboxGst,
                      ),
                      const SizedBox(height: 11),
                      checkBoxCon(
                        controller: flightController,
                        title: 'FLIGHT',
                        isChecked: isCheckedFlight,
                        onTap: toggleCheckboxFlight,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 21),
                CustomBtn(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentScreen()));
                    },
                    title: 'Continue')
              ],
            ),
          ),
        ),
      ),
    );
  }
}