import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFormField extends StatelessWidget {
  final IconData? prefix;
  final IconData? suffix;

  final TextEditingController controller;

  final String validateText;

  final bool isPassword;

  final double borderRadius;

  final bool readOnly;

  final TextInputType inputType;

  final String? hintText;
  final String? labelText;
  final TextAlign textAlign;

  final Function()? suffixPressed;

  const MyFormField({
    Key? key,
    this.borderRadius = 15,
    required this.controller,
    required this.validateText,
    this.suffixPressed,
    this.isPassword = false,
    required this.inputType,
    this.hintText,
    this.prefix,
    this.suffix,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return validateText;
          }
          return null;
        },
        obscureText: isPassword,
        keyboardType: inputType,
        textAlign: textAlign,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              color: GlobalCubit.get(context).mediumTextColor,
            ),
          ),
          prefixIcon: Icon(
            prefix,
            color: GlobalCubit.get(context).mediumTextColor,
          ),
          hintText: hintText!.tr(),
          labelText: labelText,
          labelStyle:
              TextStyle(color: GlobalCubit.get(context).regularTextColor),
          hintStyle:
              TextStyle(color: GlobalCubit.get(context).regularTextColor),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: GlobalCubit.get(context).isDark
                ? BorderSide.none
                : const BorderSide(
                    color: AppColor.teal,
                  ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: GlobalCubit.get(context).isDark
                ? BorderSide.none
                : BorderSide(
                    color: Colors.grey.shade300,
                    width: 2.0,
                  ),
          ),
          fillColor: GlobalCubit.get(context).colorOfFormField,
          filled: true,
        ),
        style: TextStyle(color: GlobalCubit.get(context).regularTextColor),
      ),
    );
  }
}
