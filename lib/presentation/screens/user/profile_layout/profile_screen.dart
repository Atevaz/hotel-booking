import 'package:booking_hotel/business_logic/auth_cubit/auth_cubit.dart';
import 'package:booking_hotel/business_logic/profile_cubit/profile_cubit.dart';
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
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileInitial) {
          ProfileCubit.get(context).getProfile();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: ConditionalBuilder(
              condition: ProfileCubit.get(context).userModel != null,
              builder: (context) => SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(
                                text: ProfileCubit.get(context)
                                    .userModel!
                                    .user
                                    .name),
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
                         CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              ProfileCubit.get(context).userModel!.user.image ==
                                      null
                                  ? AssetImage('assets/images/user.jpg')
                                  : Image.network(ProfileCubit.get(context)
                                      .userModel!
                                      .user
                                      .image!).image,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    ProfileScreenComponent(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRouterNames.rChangePasswordLayoutRoute);
                      },
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
                  ]),
                ),
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
