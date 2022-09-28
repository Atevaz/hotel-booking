import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final global = GlobalCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColor.teal,
            unselectedItemColor: AppColor.grey,
            currentIndex: global.currentIndex,
            onTap: global.changeNavBar,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_add_outlined),
                label: 'Booking'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: 'Me'.tr(),
              ),
            ],
          ),
          body: GlobalCubit.get(context)
              .screens[GlobalCubit.get(context).currentIndex],
        );
      },
    );
  }
}
