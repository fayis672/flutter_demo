import 'package:demo/features/edit/presentation/edit_page.dart';
import 'package:demo/features/home/presenation/home_app_bar.dart';
import 'package:demo/features/home/widgets/bottom_nav_bar.dart';
import 'package:demo/features/stamp/presentation/stamp_page.dart';
import 'package:demo/utils/contants/color.dart';
import 'package:demo/utils/contants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  int calculateGridColumns(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int columns = (screenWidth / 330).round();
    return columns > 0 ? columns : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
            color: Colors.amber,
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [AppColors.primaryColor, AppColors.lightYellow],
              // colors: [Colors.red, Colors.black],
            ),
          ),
          child: const Center(child: Text('2022年 5月 26日（木）')),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 80,
          child: GetBuilder<HomeController>(
            init: HomeController(),
            id: Get.find<HomeController>().dataIndexId,
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _NumberItem(
                      isSelected: controller.dateIndex == index,
                      onTap: () {
                        controller.changeDateIndex(index);
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: calculateGridColumns(context),
                  mainAxisExtent: 500,
                  childAspectRatio: 1 / 2),
              itemCount:
                  20, // Change this to the actual number of items you want to display.
              itemBuilder: (context, index) {
                return const _CardItem();
              }),
        ),
      ]),
      bottomNavigationBar: CustomBottomNavigationBar(
        onMainButtonTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StampPage(),
              ));
        },
        onPageChanged: (index) {
          ///handle page changes
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditPage(),
              ));
        },
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: SvgPicture.asset('assets/icons/location_icon.svg'),
      ),
    );
  }
}

class _NumberItem extends StatelessWidget {
  const _NumberItem({required this.isSelected, required this.onTap});

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 10),
          duration: const Duration(milliseconds: 200),
          width: 50,
          height: 70,
          decoration: ShapeDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          ),
          child: Column(children: [
            Text(
              '木',
              style: isSelected
                  ? AppTextStyle.text17Bold
                  : AppTextStyle.text17Bold
                      .copyWith(color: AppColors.mainTextColor),
            ),
            // const Spacer(),
            Text(
              '23',
              style: isSelected
                  ? AppTextStyle.text17Bold
                  : AppTextStyle.text17Bold
                      .copyWith(color: AppColors.mainTextColor),
            ),
          ]),
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Container(
        width: 300,
        height: 180,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Stack(clipBehavior: Clip.none, children: [
                Image.asset(
                  'assets/images/img.png',
                  // width: 300,
                  // height: 180,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 10,
                  left: -10,
                  child: Container(
                    width: 74,
                    height: 20,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFF6162),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.43),
                      ),
                    ),
                    child: Text(
                      '本日まで',
                      textAlign: TextAlign.center,
                      style:
                          AppTextStyle.text10.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    '介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）',
                    maxLines: 2,
                    style: AppTextStyle.text12,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "介護付き有料老人ホーム",
                        style: AppTextStyle.text10,
                      ),
                      Text(
                        '¥ 6,000',
                        style: AppTextStyle.text17Bold
                            .copyWith(color: AppColors.mainTextColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "5月 31日（水）08 : 00 ~ 17 : 00",
                      style: AppTextStyle.text12,
                      // textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('北海道札幌市東雲町3丁目916番地17号',
                        style: AppTextStyle.text12),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('交通費 300円', style: AppTextStyle.text12)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '交通費 300円',
                        style: AppTextStyle.text12
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      SvgPicture.asset('assets/icons/like_icoc_grey.svg')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
