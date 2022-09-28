import 'package:booking_hotel/core/styles/colors.dart';
import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/presentation/view/explore_search_selector.dart';
import 'package:booking_hotel/presentation/widget/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreSearchBar extends StatelessWidget {
  const ExploreSearchBar({
    Key? key,
    required this.show,
    required this.cubit,
  }) : super(key: key);

  final HotelCubit cubit;
  final bool show;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: Alignment.topCenter,
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: show ? null : 0,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: cubit.currentLayoutIndex == 0 ? 0 : 10.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      MyFormField(
                        borderRadius: 40.r,
                        controller: cubit.searchC,
                        prefix: null,
                        validateText: cubit.searchC.text,
                        inputType: TextInputType.text,
                        hintText: "Search...",
                        suffix: Icons.arrow_downward_outlined,
                        suffixPressed: cubit.toggleSearchTypes,
                      ),
                      ExploreSearchSelector(
                        show: cubit.showSearchTypes,
                        onChange: cubit.updateSelectedSearchType,
                        currentValue: cubit.searchType,
                        color: Theme.of(context).cardColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Material(
                  shape: const CircleBorder(),
                  color: AppColor.teal,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: cubit.search,
                    child: SizedBox(
                      width: 60.w,
                      height: 60.h,
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
          ],
        ),
      ),
    );
  }
}
