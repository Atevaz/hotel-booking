import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity,kToolbarHeight),
          child: MyAppBar(isCompletedAppBar: true)),
    );
  }
}
