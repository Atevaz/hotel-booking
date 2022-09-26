import 'dart:io';

import 'package:booking_hotel/business_logic/profile_cubit/profile_cubit.dart';
import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/default_text_form_field.dart';
import 'package:booking_hotel/presentation/widget/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
      if (state is UpdateProfileSuccessState) {
        showToast(text: 'Profile Updated', state: ToastStates.SUCCESS);
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      if (state is GetProfileSuccessState) {
        ProfileCubit.get(context).nameController.text =
            ProfileCubit.get(context).userModel!.user.name;
        ProfileCubit.get(context).emailController.text =
            ProfileCubit.get(context).userModel!.user.email;
      }
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: const MyAppBar(
            isCompletedAppBar: true,
            title: 'Edit Profile',
            isBack: true,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: Stack(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        CircleAvatar(
                          backgroundImage: ProfileCubit.get(context)
                                  .path
                                  .isNotEmpty
                              ? Image.file(File(ProfileCubit.get(context).path))
                                  .image
                              : ProfileCubit.get(context)
                                          .userModel!
                                          .user
                                          .image ==
                                      null
                                  ? AssetImage('assets/images/user.jpg')
                                  : Image.network(ProfileCubit.get(context)
                                          .userModel!
                                          .user
                                          .image!)
                                      .image,
                          radius: 60,
                        ),
                        Positioned(
                            top: 80,
                            left: 80,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 18,
                              child: InkWell(
                                onTap: () async {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 200,
                                        color: Colors.white,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              InkWell(
                                                onTap: () {
                                                  ProfileCubit.get(context)
                                                      .pickImage(
                                                          ImageSource.camera);
                                                  Navigator.pop(context);
                                                },
                                                child: ListTile(
                                                  leading:
                                                      Icon(Icons.photo_library),
                                                  title: Text('Pick an image'),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  ProfileCubit.get(context)
                                                      .pickImage(
                                                          ImageSource.gallery);
                                                },
                                                child: ListTile(
                                                  leading:
                                                      Icon(Icons.camera_alt),
                                                  title:
                                                      Text('Capture a photo'),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      MyFormField(
                        // initialValue: ProfileCubit.get(context).userModel!.user.name,
                        controller: ProfileCubit.get(context).nameController,
                        validateText: "validateText",
                        inputType: TextInputType.text,
                        borderRadius: 30.r,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      MyFormField(
                        // initialValue: ProfileCubit.get(context).userModel!.user.email,
                        controller: ProfileCubit.get(context).emailController,
                        validateText: "validateText",
                        inputType: TextInputType.emailAddress,
                        borderRadius: 30.r,
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      MyButton(
                        onPressed: () async {
                          ProfileCubit.get(context).updateProfile(
                              image: ProfileCubit.get(context).path.isNotEmpty
                                  ? await MultipartFile.fromFile(
                                      ProfileCubit.get(context).path)
                                  : null,
                              name:
                                  ProfileCubit.get(context).nameController.text,
                              email: ProfileCubit.get(context)
                                  .emailController
                                  .text);
                        },
                        text: "Update",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
