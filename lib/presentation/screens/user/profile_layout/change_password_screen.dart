import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final passC = TextEditingController();
  final confirmPassC = TextEditingController();
  bool hidePass = true;

  final String changePassText =
      "Enter your new password  and confirm you password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Avenir',
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    changePassText,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Avenir',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyFormField(
                  controller: passC,
                  validateText: "validateText",
                  inputType: TextInputType.text,
                  hintText: "Password",
                  isPassword: hidePass,
                  prefix: Icons.password_outlined,
                  suffix: hidePass ? Icons.visibility_off : Icons.visibility,
                  suffixPressed: () {
                    setState(() {
                      hidePass = !hidePass;
                    });
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyFormField(
                  controller: confirmPassC,
                  validateText: "validateText",
                  inputType: TextInputType.text,
                  hintText: "Confirm Password",
                  isPassword: hidePass,
                  prefix: Icons.password_outlined,
                  suffix: hidePass ? Icons.visibility_off : Icons.visibility,
                  suffixPressed: () {
                    setState(() {
                      hidePass = !hidePass;
                    });
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyButton(
                  onPressed: () {
                    //TODO
                  },
                  text: "Apply",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
