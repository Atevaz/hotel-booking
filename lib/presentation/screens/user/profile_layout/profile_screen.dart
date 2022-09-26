import 'package:booking_hotel/business_logic/auth_cubit/auth_cubit.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/profile_screen_component.dart';
import 'package:booking_hotel/presentation/widget/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutLoadedState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouterNames.rLoginLayoutRoute,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadLineText(text: ' Mohamed'),
                        DefaultTextButton(
                          text: 'View and Edit profile',
                          color: AppColor.grey,
                          onPressed: () {
                            Navigator.pushNamed(context,
                                AppRouterNames.rUpdateProfileLayoutRoute);
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                const ProfileScreenComponent(
                  componentTitle: 'Change Password',
                  componentIcon: Icon(
                    Icons.lock,
                    size: 30,
                  ),
                ),
                const Divider(color: AppColor.grey),
                const ProfileScreenComponent(
                  componentTitle: 'Invite Friend',
                  componentIcon: Icon(
                    Icons.people,
                    size: 30,
                  ),
                ),
                const Divider(color: AppColor.grey),
                const ProfileScreenComponent(
                  componentTitle: 'Credit & Coupons',
                  componentIcon: Icon(
                    Icons.card_giftcard,
                    size: 30,
                  ),
                ),
                const Divider(color: AppColor.grey),
                const ProfileScreenComponent(
                  componentTitle: 'Help Center',
                  componentIcon: Icon(
                    Icons.help,
                    size: 30,
                  ),
                ),
                const Divider(color: AppColor.grey),
                const ProfileScreenComponent(
                  componentTitle: 'Payment',
                  componentIcon: Icon(
                    Icons.wallet,
                    size: 30,
                  ),
                ),
                const Divider(color: AppColor.grey),
                const ProfileScreenComponent(
                  componentTitle: 'Settings',
                  componentIcon: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                ),
                ProfileScreenComponent(
                  onTap: AuthCubit.get(context).logout,
                  componentTitle: 'Logout',
                  componentIcon: Icon(
                    Icons.logout,
                    size: 30.r,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
