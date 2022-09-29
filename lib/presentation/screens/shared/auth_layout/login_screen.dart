import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/data/model/param_models/login_param_model.dart';
import 'package:booking_hotel/presentation/widget/app_custom_check_box.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/default_text_form_field.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:booking_hotel/presentation/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final String loginText = "Login";
  final emailText = "Email Address";
  final passwordText = "Password";
  final signupText = "Sign Up";
  final rememberMeText = "Remember me";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        debugPrint("$state");
        if (state is LoginLoadedState) {
          showToast(
            text: GlobalCubit.get(context).locale.languageCode == 'en'
                ? state.responseModel.status.enMessage
                : state.responseModel.status.arMessage,
            state: ToastStates.SUCCESS,
          );
          HotelCubit.get(context).initHomeScreen();
          HotelCubit.get(context).initSearchScreen();
          BookingCubit.get(context).initBooking(
            state.responseModel.user.token,
          );
          UserCubit.get(context).getProfile();
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouterNames.rHomeLayoutRoute,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        final auth = UserCubit.get(context);
        String? err;
        if (state is LoginLoadingErrorState) {
          err = state.message;
        }
        return Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 25.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadLineText(
                      text: loginText,
                      fontSize: 28.sp,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    MyFormField(
                      controller: emailC,
                      validateText: emailC.text,
                      inputType: TextInputType.emailAddress,
                      hintText: emailText,
                      prefix: Icons.email_outlined,
                      borderRadius: 30.r,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    MyFormField(
                      controller: passC,
                      validateText: passC.text,
                      inputType: TextInputType.text,
                      hintText: passwordText,
                      isPassword: hidePass,
                      prefix: Icons.password_outlined,
                      suffix:
                          hidePass ? Icons.visibility_off : Icons.visibility,
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
                        text: rememberMeText,
                        onTap: () {
                          setState(() {
                            checked = !checked;
                          });
                        }),
                    err != null
                        ? Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              MediumText(
                                text: err,
                                color: Colors.red,
                              ),
                            ],
                          )
                        : state is LoginLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Container(),
                    SizedBox(
                      height: 20.h,
                    ),
                    MyButton(
                      onPressed: () {
                        final email = emailC.text;
                        final pass = passC.text;
                        final param = LoginParamModel(
                          email: email,
                          password: pass,
                        );
                        auth.login(param, checked);
                      },
                      text: loginText,
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
                          child: MediumText(
                            text: signupText,
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
      },
    );
  }
}
