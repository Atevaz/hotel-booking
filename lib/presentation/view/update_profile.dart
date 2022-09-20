import 'dart:ui';

import 'package:booking_hotel/presentation/widget/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.arrow_back_ios_rounded),
              SizedBox(
                height: 15,
              ),
              Text('Edit Profile',
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: Stack(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                      radius: 60,
                    ),
                    const Positioned(
                        top: 80,
                        left: 80,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 18,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Password',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Phone',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Date of birth',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Address',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
