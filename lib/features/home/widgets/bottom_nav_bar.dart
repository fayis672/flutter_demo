import 'package:demo/utils/contants/color.dart';
import 'package:demo/utils/contants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar(
      {super.key, required this.onPageChanged, required this.onMainButtonTap});

  final ValueChanged<int> onPageChanged;
  final VoidCallback onMainButtonTap;

  final List<String> _titles = ["さがす", 'お仕事', '', 'チャット', 'マイページ'];

  final List<String> _icons = [
    "assets/icons/first.svg",
    'assets/icons/seconde.svg',
    '',
    'assets/icons/third.svg',
    'assets/icons/fourth.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 75,
          width: MediaQuery.of(context).size.width,
          color: AppColors.white,
          child: GetBuilder<HomeController>(
            init: HomeController(),
            id: Get.find<HomeController>().navIndexId,
            builder: (controller) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    5,
                    (index) {
                      if (index == 2) {
                        return const SizedBox(
                          width: 30,
                        );
                      }

                      return _NavItem(
                          onTap: () {
                            controller.changeNavIndex(index);
                            onPageChanged(index);
                          },
                          iconData: _icons[index],
                          title: _titles[index],
                          isSelected: index == controller.navIndex);
                    },
                  ));
            },
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            top: -30,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                    onTap: onMainButtonTap,
                    child: SvgPicture.asset('assets/icons/main_icon.svg')),
                GestureDetector(
                    onTap: onMainButtonTap,
                    child: SvgPicture.asset('assets/icons/scan_icon.svg'))
              ],
            )),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String iconData;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            iconData,
            color:
                isSelected ? AppColors.primaryColor : AppColors.mainTextColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: isSelected
              ? AppTextStyle.text8.copyWith(color: AppColors.primaryColor)
              : AppTextStyle.text8,
        ),
      ],
    );
  }
}
