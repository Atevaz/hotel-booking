import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/screens/user/auth_layout/register_screen.dart';
import 'package:booking_hotel/presentation/widget/caption_of_onboarding.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/text_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  final List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboarding1.png',
      title: 'Book Your Hotel From Your Device',
      body:
          'we are constantly adding your Favorite restaurant throughout the territory and arount your area carefully selected',
    ),
    BoardingModel(
      image: 'assets/images/onboarding2.png',
      title: 'Hotel EveryWere And Anytime',
      body:
          'we are constantly adding your Favorite restaurant throughout the territory and arount your area carefully selected',
    ),
    BoardingModel(
      image: 'assets/images/onboarding3.png',
      title: 'Your Comfortable Here In Our Hotels',
      body:
          'we are constantly adding your Favorite restaurant throughout the territory and arount your area carefully selected',
    ),
  ];

  final boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/logo.png',
                color: AppColor.teal,
              ),
            ),
            Expanded(
              flex: 2,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,

                itemBuilder: (context, index) {
                  return buildOnBoarding(boarding[index]);
                }
                    ,
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
              controller: boardController,
              count: boarding.length,
              axisDirection: Axis.horizontal,
              effect: const ExpandingDotsEffect(
                  spacing: 4,
                  radius: 10,
                  dotWidth: 15,
                  dotHeight: 5.0,
                  activeDotColor: AppColor.teal),
            ),
            const SizedBox(
              height: 10,
            ),
            MyButton(
              text: 'Get Started'  ,
              onPressed: () => Navigator.pushReplacementNamed(
                context,
                AppRouterNames.rLoginLayoutRoute,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t has any account ?'),
                DefaultTextButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouterNames.rRegisterLayoutRoute,
                    (route) => false,
                  ),
                  text: 'Register',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnBoarding(BoardingModel model) => Column(
        children: [
          Expanded(
            child: Image.asset(
              model.image,
            ),
          ),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          CaptionOfOnBoarding(
            text: model.body,
            fontSize: 16,
          ),
        ],
      );
}
