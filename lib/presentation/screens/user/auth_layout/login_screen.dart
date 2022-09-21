import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/app_custom_check_box.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/default_text_form_field.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  bool hidePass = true;
  bool checked = false;

  final String dontHaveAccountText = "Create new account?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,

      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 50.h,
              horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadLineText(
                  text: "Log in",
                  fontSize: 28.sp,
                  color: AppColor.black,
                ),
                SizedBox(
                  height: 40.h,
                ),
                MyFormField(
                  controller: emailC,
                  validateText: emailC.text,
                  inputType: TextInputType.emailAddress,
                  hintText: "Email Address",
                  prefix: Icons.email_outlined,
                  borderRadius: 30.r,
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
                  borderRadius: 30.r,
                ),
                SizedBox(
                  height: 5.h,
                ),
                AppCustomCheckBox(
                    checked: checked,
                    text: "Remember me",
                    onTap: () {
                      setState(() {
                        checked = !checked;
                      });
                    }),
                SizedBox(
                  height: 20.h,
                ),
                MyButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouterNames.rHomeLayoutRoute,
                      (route) => false,
                    );
                  },
                  text: "Login",
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MediumText(
                      text: dontHaveAccountText,
                      color: AppColor.grey,
                      fontSize: 17,
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRouterNames.rRegisterLayoutRoute,
                        (route) => false,
                      ),
                      child: const MediumText(
                        text: "Sign up",
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
