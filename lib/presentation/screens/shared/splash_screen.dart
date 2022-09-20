import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:booking_hotel/presentation/widget/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/backpacker.jpg'),
          Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Card(
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(
                height: 10.h,
              ),
              const HeadLineText(text: 'Hotellato'),
              const MediumText(text: 'Best hotel deals for your holiday'),
              SizedBox(
                height: 150.h,
              ),
              MyButton(
                text: 'Get Started',
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRouterNames.rLoginLayoutRoute,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have account?'),
                  DefaultTextButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      AppRouterNames.rLoginLayoutRoute,
                    ),
                    text: 'LogIn',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
