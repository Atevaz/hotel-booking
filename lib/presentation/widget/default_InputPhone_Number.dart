import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../business_logic/global_cubit/global_cubit.dart';
import '../../core/styles/colors.dart';
import '../../core/styles/constant.dart';



class DefaultInputPhoneNumber extends StatelessWidget {
   PhoneNumber? number;
  final TextEditingController? controller;
  final String validateText;
  final bool autoFocus;


  DefaultInputPhoneNumber({
    required this.number,
    required this.controller,
    required this.validateText,
    this.autoFocus = false,
});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: GlobalCubit.get(context).colorOfFormField,
        borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: InternationalPhoneNumberInput(

          onInputChanged: (PhoneNumber number1) {
            //print(number1.phoneNumber);

            phoneNumber=number1.phoneNumber;
          },
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          initialValue: number,
          autoFocus:  autoFocus,
          validator: (value) {
            if (value!.isEmpty) {
              return validateText;
            }
            return null;
          },
          selectorTextStyle: TextStyle(
              color: GlobalCubit.get(context).regularTextColor,
              fontSize: 16.sp
          ),
          textStyle: TextStyle(
              color: GlobalCubit.get(context).regularTextColor,
              fontSize: 16.sp
          ),
          cursorColor: AppColor.blue,
          textFieldController: controller,
          inputDecoration: InputDecoration(
            contentPadding: EdgeInsetsDirectional.only(bottom: 15,start: 0),
            border: InputBorder.none,

            hintText: 'Mobile number',
            hintStyle: TextStyle(
              color: GlobalCubit.get(context).regularTextColor,
            ),


          ),
        ),
      ),
    );
  }


}
