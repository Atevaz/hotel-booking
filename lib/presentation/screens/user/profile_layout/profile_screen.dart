import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:booking_hotel/presentation/widget/profile_screen_component.dart';
import 'package:booking_hotel/presentation/widget/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ListTile(
          title: const MediumText(text: 'Mohamed'),
          subtitle: DefaultTextButton(
            text: 'View and Edit profile',
            onPressed: () {

              Navigator.pushNamed(context, AppRouterNames.rUpdateProfileLayoutRoute);

            },
          ),
          trailing: const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/user.jpg'),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        const ProfileScreenComponent(
            componentTitle: 'Change Password',
            componentIcon: Icon(
              Icons.lock,
              size: 30,
            )),
        const Spacer(),
        const ProfileScreenComponent(
            componentTitle: 'Invite Friend',
            componentIcon: Icon(
              Icons.people,
              size: 30,
            )),
        const Spacer(),
        const ProfileScreenComponent(
            componentTitle: 'Credit & Coupons',
            componentIcon: Icon(
              Icons.card_giftcard,
              size: 30,
            )),
        const Spacer(),
        const ProfileScreenComponent(
            componentTitle: 'Help Center',
            componentIcon: Icon(
              Icons.help,
              size: 30,
            )),
        const Spacer(),
        const ProfileScreenComponent(
            componentTitle: 'Payment',
            componentIcon: Icon(
              Icons.wallet,
              size: 30,
            )),
        const Spacer(),
        const ProfileScreenComponent(
            componentTitle: 'Settings',
            componentIcon: Icon(
              Icons.settings,
              size: 30,
            )),
      ]),
    );
  }
}
