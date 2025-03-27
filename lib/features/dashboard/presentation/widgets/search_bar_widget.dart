import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/responsive.dart';

class CustomSearchBar extends StatelessWidget {
  final Function()? onSearchIconTap;
  final String hintText;

  const CustomSearchBar({
    Key? key,
    this.onSearchIconTap,
    this.hintText = 'Search menu, restaurant or etc',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((
        Set<MaterialState> states,
      ) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: AppColors.midGrey, width: 1.0),
        );
      }),
      backgroundColor: WidgetStateColor.resolveWith((states) => Colors.white),
      hintText: hintText,
      shadowColor: WidgetStateColor.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset(AppConstant.searchIcon),
      ),
      trailing: [IconButton(icon: Icon(Icons.tune), onPressed: () {})],
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Filter',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.sp),
        ),
        SizedBox(height: responsiveHeight(context, 5)),
        Text('Price Range', style: TextStyle(color: Colors.grey[500])),
        SizedBox(height: responsiveHeight(context, 5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Min',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(width: responsiveWidth(context, 15)),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Max',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
