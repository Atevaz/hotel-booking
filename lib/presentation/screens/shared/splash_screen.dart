import 'dart:async';
import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/business_logic/hotel_cubit/hotel_cubit.dart';
import 'package:booking_hotel/business_logic/user_cubit/user_cubit.dart';
import 'package:booking_hotel/core/constants/error_messages.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/core/utils/media_query_extension.dart';
import 'package:booking_hotel/presentation/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;

  double _containerSize = 1.5;

  double _textOpacity = 0.0;

  double _containerOpacity = 0.0;

  late AnimationController _controller;

  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();
    UserCubit.get(context).loginSaved();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is LoginSavedLoadingErrorState &&
            (state.message == Network_Connection_En_Error ||
                state.message == Network_Connection_Ar_Error)) {
          showToast(
            text: state.message,
            state: ToastStates.ERROR,
          );
        } else if (state is LoginSavedLoadedState) {
          if (state.responseModel == null) {
            Future.delayed(const Duration(seconds: 4)).then(
              (value) => Navigator.pushNamedAndRemoveUntil(
                context,
                AppRouterNames.rOnBoardingLayoutRoute,
                (route) => false,
              ),
            );
          } else {
            HotelCubit.get(context).initHomeScreen();
            HotelCubit.get(context).initSearchScreen();
            BookingCubit.get(context).initBooking(
              state.responseModel!.user.token,
            );
            UserCubit.get(context).getProfile();
            Future.delayed(const Duration(seconds: 4)).then(
              (value) => Navigator.pushNamedAndRemoveUntil(
                context,
                AppRouterNames.rHomeLayoutRoute,
                (route) => false,
              ),
            );
          }
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                AnimatedContainer(
                    duration: const Duration(milliseconds: 5000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: context.screenHeight / _fontSize),
                AnimatedOpacity(
                    duration: const Duration(milliseconds: 5000),
                    opacity: _textOpacity,
                    child: RichText(
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.end,
                      textDirection: TextDirection.rtl,
                      softWrap: true,
                      maxLines: 1,
                      textScaleFactor: 1,
                      text: const TextSpan(
                        text: 'Hotel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                            fontSize: 22,
                            color: AppColor.blue),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'To',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                                fontSize: 22,
                                color: AppColor.yellow),
                          ),
                          TextSpan(
                            text: 'night',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                                fontSize: 22,
                                color: AppColor.darkRed),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 4000),
                curve: Curves.fastLinearToSlowEaseIn,
                opacity: _containerOpacity,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 4000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: context.screenWidth / _containerSize,
                  width: context.screenWidth / _containerSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset(
                      'assets/images/HotelTonight.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 5000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.easeInOutCirc,
              parent: animation,
            );
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}
