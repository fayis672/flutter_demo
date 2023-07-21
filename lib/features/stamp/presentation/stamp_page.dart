import 'package:demo/utils/contants/color.dart';
import 'package:demo/utils/contants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StampPage extends StatelessWidget {
  const StampPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xffA8B1FF),
            pinned: true,
            centerTitle: true,
            title: Text(
              'スタンプカード詳細',
              style: AppTextStyle.text14.copyWith(color: AppColors.white),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF939EFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 15,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            actions: [
              SvgPicture.asset('assets/icons/minus-icon.svg'),
              const SizedBox(
                height: 20,
                width: 20,
              ),
            ],
            expandedHeight: 170,
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                Positioned(
                  top: 50,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Mer キッチン',
                          style: AppTextStyle.text16,
                        ),
                        Row(
                          children: [
                            Text(
                              '現在の獲得数',
                              style: AppTextStyle.text14
                                  .copyWith(color: AppColors.white),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '30',
                              style: AppTextStyle.text17Bold.copyWith(
                                  color: AppColors.white, fontSize: 24),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '個',
                              style: AppTextStyle.text16
                                  .copyWith(color: AppColors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -1,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const _StarItem();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'スタンプ獲得履歴',
                  style:
                      AppTextStyle.text14.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListView.separated(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const _HistoryItem();
                },
                separatorBuilder: (context, index) => const Divider(),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

class _StarItem extends StatelessWidget {
  const _StarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(15),
        // height: 200,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 15,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 5,
            crossAxisSpacing: 15,
            mainAxisSpacing: 32,
            // childAspectRatio: 2 / 3,
            children: List.generate(
                15,
                (index) => Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/star_icon.svg'),
                        SvgPicture.asset('assets/icons/tick_icon.svg')
                      ],
                    )),
          ),
        ),
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        title: Text(
          '2021 / 11 / 18',
          style: AppTextStyle.text12.copyWith(color: AppColors.greyTextColor),
        ),
        subtitle: const Text(
          'スタンプを獲得しました',
          style: AppTextStyle.text14,
        ),
        trailing: const Text(
          '1 個',
          style: AppTextStyle.text14,
        ),
      ),
    );
  }
}
