import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/business_logic/business_logic.dart';
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
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is LogoutLoadedState) {
          BookingCubit.get(context).onLogoutReset();
          HotelCubit.get(context).onLogoutReset();
          GlobalCubit.get(context).onLogoutReset();
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouterNames.rLoginLayoutRoute,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        final cubit = UserCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0.w,
                vertical: 20.h,
              ),
              child: SingleChildScrollView(
                child: ConditionalBuilder(
                  condition: cubit.user != null,
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
                                  text: cubit.user!.name,
                                  isUpper: false,
                                ),
                                DefaultTextButton(
                                  text: 'View and Edit profile',
                                  color: AppColor.grey,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRouterNames.rUpdateProfileLayoutRoute,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: cubit.user!.image == null ||
                                    cubit.user!.image ==
                                        'http://api.mahmoudtaha.com/images'
                                ? const AssetImage('assets/images/user.jpg')
                                : Image.network(
                                    !cubit.user!.image!.contains("http")
                                        ? "$baseApiUrl$apiImagesVersion/${cubit.user!.image!}"
                                        : cubit.user!.image!,
                                    loadingBuilder: (ctx, child, event) =>
                                        event == null
                                            ? child
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                    errorBuilder: (ctx, child, err) =>
                                        err == null
                                            ? (child as Widget)
                                            : const Center(
                                                child: Icon(
                                                  Icons.error,
                                                  size: 30,
                                                ),
                                              ),
                                  ).image,
                          ),
                        ],
                      ),
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
                      onTap: cubit.logout,
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
    );
  }
}
