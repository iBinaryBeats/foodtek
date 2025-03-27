import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';

class CustomSearchBar extends StatelessWidget {
  final Function()? onSearchIconTap;
  final Function()? onFilterIconTap;
  final String hintText;

  const CustomSearchBar({
    Key? key,
    this.onSearchIconTap,
    this.onFilterIconTap,
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
      trailing: [
        IconButton(icon: Icon(Icons.tune), onPressed: onFilterIconTap),
      ],
    );
  }
}
