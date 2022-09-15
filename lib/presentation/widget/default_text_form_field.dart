import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/global_cubit/global_cubit.dart';
import '../styles/colors.dart';


class MyFormField extends StatelessWidget {
  final IconData? prefix;
  final IconData? suffix;

  final TextEditingController controller;

  //final VoidCallback? onTap ;
  final String validateText;

  final bool isPassword;

  final bool readOnly;

  final TextInputType inputType;

   String? hintText;
   String? labelText;
  final TextAlign textAlign;

  //final Color? color;
  void Function()? suffixPressed;

  MyFormField({
    Key? key,
    required this.controller,
    required this.validateText,
    this.suffixPressed,
    this.isPassword = false,
    required this.inputType,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    //this.color ,
    //this.onTap ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return validateText;
        }
      },
      //onTap: onTap,
      obscureText: isPassword,
      keyboardType: inputType,
      textAlign: textAlign,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix,color: GlobalCubit.get(context).mediumTextColor,),
        ),
        prefixIcon: Icon(
          prefix,
          color: GlobalCubit.get(context).mediumTextColor,
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
            color: GlobalCubit.get(context).regularTextColor
        ),
        hintStyle: TextStyle(
          color: GlobalCubit.get(context).regularTextColor
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          borderSide: GlobalCubit.get(context).isDark
              ? BorderSide.none
              : BorderSide(
                  color: AppColor.blue,
                ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
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
      style: TextStyle(
          color: GlobalCubit.get(context).regularTextColor
      ),
    );
  }
}
