import 'package:booking_hotel/business_logic/profile_cubit/profile_cubit.dart';
import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/default_text_form_field.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:booking_hotel/presentation/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccessState) {
          showToast(text: 'Password Changed', state: ToastStates.SUCCESS);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: AppBar().preferredSize,
            child: const MyAppBar(
              isBack: true,
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
                    const HeadLineText(
                      text: "Change Password",
                      isUpper: false,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 300,
                      child: MediumText(
                        text: changePassText,
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
                      suffix:
                          hidePass ? Icons.visibility_off : Icons.visibility,
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
                      suffix:
                          hidePass ? Icons.visibility_off : Icons.visibility,
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
                        ProfileCubit.get(context).changePassword(
                          password: passC.text,
                          confirmedPassword: confirmPassC.text,
                          email:
                              ProfileCubit.get(context).userModel!.user.email,
                        );
                      },
                      text: "Apply",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
