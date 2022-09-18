import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
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
      currentIndex: GlobalCubit.get(context).currentIndex,

      onTap: (index) {
        GlobalCubit.get(context).changeNavBar(index);
      },

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_outlined),
          label: 'Account',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_home_rounded),
          label: 'My Card',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
