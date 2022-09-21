import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/presentation/view/hotel_card.dart';
import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/widget/default_text_form_field.dart';
import 'package:booking_hotel/presentation/widget/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchC = TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: MyAppBar(
          title: "Explore",
          leadingIcon: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: AppColor.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.map,
                color: AppColor.black,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: MyFormField(
                      borderRadius: 30.r,
                      controller: searchC,
                      prefix: null,
                      validateText: searchC.text,
                      inputType: TextInputType.text,
                      hintText: "London...",
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Material(
                    shape: const CircleBorder(),
                    color: AppColor.teal,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {
                        //TODO
                      },
                      child: SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: Icon(
                          Icons.search,
                          color: AppColor.white,
                          size: 25.r,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediumText(
                        text: "Choose Date",
                        fontSize: 20.sp,
                        color: AppColor.grey,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      MediumText(
                        text: "09, May - 14, May",
                        fontSize: 18.sp,
                        color: AppColor.black,
                      ),
                    ],
                  ),
                  Container(
                    color: AppColor.grey,
                    width: 2.w,
                    height: 50.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediumText(
                        text: "Number of Rooms",
                        fontSize: 20.sp,
                        color: AppColor.grey,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      MediumText(
                        text: "1 Room 2 People",
                        fontSize: 18.sp,
                        color: AppColor.black,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                color: AppColor.grey,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MediumText(
                    text: "530 Hotel Found",
                    fontSize: 20.sp,
                    color: AppColor.black,
                  ),
                  InkWell(
                    onTap: () {
                      //TODO
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MediumText(
                          text: "Filter",
                          fontSize: 20.sp,
                          color: AppColor.black,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Icon(
                          Icons.format_align_left,
                          color: AppColor.teal,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 11,
                  itemBuilder: (_, index) {
                    EdgeInsets pad = EdgeInsets.zero;
                    if (index != 10) {
                      pad = EdgeInsets.only(bottom: 20.h);
                    }
                    return Padding(
                      padding: pad,
                      child: const HotelCard(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
