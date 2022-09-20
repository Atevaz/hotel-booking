import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
import 'package:booking_hotel/core/styles/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  //PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

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
    );
  }
}
