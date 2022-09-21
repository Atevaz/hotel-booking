import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
import 'package:booking_hotel/business_logic/global_cubit/global_state.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/view/bottom_navigation_bar.dart';
import 'package:booking_hotel/presentation/view/home_views/home_hotels_view.dart';
import 'package:booking_hotel/presentation/view/home_views/home_sliver_app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColor.teal,
          unselectedItemColor: AppColor.grey,
          currentIndex: GlobalCubit.get(context).currentIndex,
          onTap: (index) {
            GlobalCubit.get(context).changeNavBar(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_add_outlined),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'Me',
            ),
          ],
        ),
        body: GlobalCubit.get(context)
            .screens[GlobalCubit.get(context).currentIndex],
      );
    });
  }
}
