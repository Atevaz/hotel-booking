import 'dart:io';

import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/widget/custom_button.dart';
import 'package:booking_hotel/presentation/widget/default_text_form_field.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
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
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccessState) {
          showToast(text: 'Profile Updated', state: ToastStates.SUCCESS);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        final cubit = UserCubit.get(context);
        if (cubit.user != null) {
          nameC.text = cubit.user!.name;
          emailC.text = cubit.user!.email;
        }
        bool loading = false;
        if (state is UpdateProfileLoadingState) {
          loading = true;
        }
        String? err;
        if (state is UpdateProfileErrorState) {
          err = state.message;
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
                        children: [
                          CircleAvatar(
                            backgroundImage: cubit.path.isNotEmpty
                                ? Image.file(File(cubit.path)).image
                                : cubit.user!.image == null ||
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
                                          height: 150,
                                          color: Colors.white,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                InkWell(
                                                  onTap: () {
                                                    cubit.pickImage(
                                                        ImageSource.gallery);
                                                    Navigator.pop(context);
                                                  },
                                                  child: const ListTile(
                                                    leading: Icon(
                                                        Icons.photo_library),
                                                    title:
                                                        Text('Pick an image'),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    cubit.pickImage(
                                                        ImageSource.camera);
                                                  },
                                                  child: const ListTile(
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
                                  child: const Icon(
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
                        const MediumText(text: 'Name'),
                        SizedBox(
                          height: 10.h,
                        ),
                        MyFormField(
                          hintText: '',
                          controller: nameC,
                          validateText: nameC.text,
                          inputType: TextInputType.text,
                          borderRadius: 30.r,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const MediumText(
                          text: 'Email',
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        MyFormField(
                          hintText: '',
                          controller: emailC,
                          validateText: emailC.text,
                          inputType: TextInputType.emailAddress,
                          borderRadius: 30.r,
                        ),
                        err != null
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Center(
                                    child: MediumText(
                                      text: err,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              )
                            : loading
                                ? Padding(
                                    padding: EdgeInsets.only(top: 10.r),
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : Container(),
                        SizedBox(
                          height: 70.h,
                        ),
                        MyButton(
                          onPressed: () async {
                            cubit.updateProfile(
                              image: cubit.path.isNotEmpty
                                  ? await MultipartFile.fromFile(cubit.path)
                                  : null,
                              name: nameC.text,
                              email: emailC.text,
                            );
                          },
                          text: "Update",
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
