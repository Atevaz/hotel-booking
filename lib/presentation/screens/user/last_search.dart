import 'package:booking_hotel/presentation/view/my_app_bar.dart';
import 'package:booking_hotel/presentation/widget/last_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastSearch extends StatefulWidget {
  const LastSearch({super.key});

  @override
  State<LastSearch> createState() => _LastSearchState();
}

class _LastSearchState extends State<LastSearch> {
  List<String> searchImages = [
    'assets/images/hotel.jpg',
    'assets/images/backpacker.jpg',
    'assets/images/resort.jpg',
    'assets/images/villa.jpg',
  ];
  List<String> searchList = ['Hotels', 'Backpacker', 'Resort', 'Villa'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: MyAppBar(
            isCompletedAppBar: true,
            leadingIcon: const Icon(Icons.close),
            title: 'Search'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20.r, left: 25.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r)),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        )),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 160.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: ((context, index) {
                      return Container(
                        width: 25.w,
                      );
                    }),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 40.r,
                            backgroundColor: Colors.red,
                            backgroundImage: AssetImage(
                              searchImages[index],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(searchList[index])
                        ],
                      );
                    },
                    itemCount: 4,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Last Searches',
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold)),
                    const Text(
                      'clear all',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                LastSearcWidget(
                    title: 'London',
                    status: '1 Room - 2 Adults',
                    history: '12 - 22 DEC',
                    image: 'assets/images/resort.jpg')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
