import 'package:demo/utils/contants/color.dart';
import 'package:demo/utils/contants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 30,
          padding: const EdgeInsets.only(left: 10),
          decoration: ShapeDecoration(
              color: AppColors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.50),
              )),
          child: const Text(
            '北海道, 札幌市',
            style: AppTextStyle.text12,
          )),
      actions: [
        SvgPicture.asset('assets/icons/like_icon.svg'),
        SvgPicture.asset('assets/icons/filter_icon.svg'),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
