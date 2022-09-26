import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/business_logic/profile_cubit/profile_cubit.dart';
import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/widget/headline_text.dart';
import 'package:booking_hotel/presentation/widget/profile_screen_component.dart';
import 'package:booking_hotel/presentation/widget/text_button.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (_, state) {
        if (state is LogoutLoadedState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouterNames.rLoginLayoutRoute,
            (route) => false,
          );
        }
      },
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileInitial) {
            ProfileCubit.get(context).getProfile();
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0.w,
                  vertical: 20.h,
                ),
                child: SingleChildScrollView(
                  child: ConditionalBuilder(
                    condition: ProfileCubit.get(context).userModel != null,
                    builder: (context) => Column(children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
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
                                      Navigator.pushNamed(
                                          context,
                                          AppRouterNames
                                              .rUpdateProfileLayoutRoute);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: ProfileCubit.get(context)
                                          .userModel!
                                          .user
                                          .image ==
                                      null
                                  ? const AssetImage('assets/images/user.jpg')
                                  : Image.network(!ProfileCubit.get(context)
                                              .userModel!
                                              .user
                                              .image!
                                              .contains("http")
                                          ? "$baseApiUrl$apiImagesVersion/${ProfileCubit.get(context).userModel!.user.image!}"
                                          : ProfileCubit.get(context)
                                              .userModel!
                                              .user
                                              .image!)
                                      .image,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ProfileScreenComponent(
                        onTap: () {
                          Navigator.pushNamed(context,
                              AppRouterNames.rChangePasswordLayoutRoute);
                        },
                        componentTitle: 'Change Password',
                        componentIcon: Icon(
                          Icons.lock,
                          size: 30,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      const Divider(
                        color: AppColor.grey,
                        thickness: 1,
                      ),
                      ProfileScreenComponent(
                        componentTitle: 'Invite Friend',
                        componentIcon: Icon(
                          Icons.people,
                          size: 30,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      const Divider(
                        color: AppColor.grey,
                        thickness: 1,
                      ),
                      ProfileScreenComponent(
                        componentTitle: 'Credit & Coupons',
                        componentIcon: Icon(
                          Icons.card_giftcard,
                          size: 30,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      const Divider(
                        color: AppColor.grey,
                        thickness: 1,
                      ),
                      ProfileScreenComponent(
                        componentTitle: 'Help Center',
                        componentIcon: Icon(
                          Icons.help,
                          size: 30,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      const Divider(
                        color: AppColor.grey,
                        thickness: 1,
                      ),
                      ProfileScreenComponent(
                        componentTitle: 'Payment',
                        componentIcon: Icon(
                          Icons.wallet,
                          size: 30,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      const Divider(
                        color: AppColor.grey,
                        thickness: 1,
                      ),
                      ProfileScreenComponent(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRouterNames.rSettingsLayoutRoute,
                        ),
                        componentTitle: 'Settings',
                        componentIcon: Icon(
                          Icons.settings,
                          size: 30,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      const Divider(
                        color: AppColor.grey,
                        thickness: 1,
                      ),
                      ProfileScreenComponent(
                        onTap: AuthCubit.get(context).logout,
                        componentTitle: 'Logout',
                        componentIcon: Icon(
                          Icons.logout,
                          size: 30.r,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ]),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
