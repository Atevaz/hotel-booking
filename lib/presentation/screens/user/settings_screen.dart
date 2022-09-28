import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/widget/profile_screen_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = GlobalCubit.get(context);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: AppBar().preferredSize,
            child: const MyAppBar(
              centerTitle: true,
              title: "Settings",
              isBack: true,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileScreenComponent(
                    onTap: () {
                      cubit.changeAppMode();
                    },
                    componentTitle: cubit.isDark ? 'Light Mode' : 'Dark Mode',
                    componentIcon: Icon(
                      cubit.isDark ? Icons.sunny : Icons.nightlight,
                      size: 30,
                      color: cubit.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const Divider(
                    color: AppColor.grey,
                    thickness: 1,
                  ),
                  ProfileScreenComponent(
                    onTap: () {
                      cubit.changeAppLocale();
                    },
                    componentTitle: cubit.locale.languageCode == 'ar'
                        ? 'الانجليزيه'
                        : 'Arabic',
                    componentIcon: Icon(
                      Icons.language,
                      size: 30,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  const Divider(
                    color: AppColor.grey,
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
