import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/default_text_form_field.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final confirmPassC = TextEditingController();
  bool hidePass = true;

  final agreedText =
      "By signing up, you agreed with our terms of services and privacy policy";

  final haveAccountText = "Already hav account? ";

  final loginText = "Log in";

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
                HeadLineText(
                  text: "Sign Up",
                  fontSize: 28.sp,
                ),
                SizedBox(
                  height: 40.h,
                ),
                MyFormField(
                  controller: nameC,
                  validateText: nameC.text,
                  inputType: TextInputType.text,
                  hintText: "User Name",
                  prefix: Icons.text_fields_outlined,
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyFormField(
                  controller: emailC,
                  validateText: emailC.text,
                  inputType: TextInputType.emailAddress,
                  hintText: "Email Address",
                  prefix: Icons.email_outlined,
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyFormField(
                  controller: passC,
                  validateText: "validateText",
                  inputType: TextInputType.text,
                  hintText: "Password",
                  prefix: Icons.password_outlined,
                  isPassword: hidePass,
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
                  prefix: Icons.password_outlined,
                  isPassword: hidePass,
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
                    Navigator.pushReplacementNamed(
                      context,
                      AppRouterNames.rLoginLayoutRoute,
                    );
                  },
                  text: "Sign up",
                ),
                SizedBox(
                  height: 30.h,
                ),
                MediumText(
                  text: agreedText,
                  color: AppColor.grey,
                  fontSize: 17,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MediumText(
                      text: haveAccountText,
                      color: AppColor.grey,
                      fontSize: 17,
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        AppRouterNames.rLoginLayoutRoute,
                      ),
                      child: MediumText(
                        text: loginText,
                        fontSize: 17,
                        color: AppColor.teal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
