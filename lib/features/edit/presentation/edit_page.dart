import 'package:demo/features/edit/widgets/custom_button.dart';
import 'package:demo/features/edit/widgets/image_picker.dart';
import 'package:demo/features/edit/widgets/text_field.dart';
import 'package:demo/utils/contants/color.dart';
import 'package:demo/utils/contants/text_style.dart';
import 'package:demo/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            width: 32,
            height: 32,
            decoration: const ShapeDecoration(
              color: Color(0x198C807A),
              shape: OvalBorder(),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                )),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Badge.count(
                  backgroundColor: const Color(0xffEE7D42),
                  // textColor: const Color(0xffEE7D42),
                  count: 99,
                  child: const Icon(Icons.notifications)))
        ],
        title: Text(
          '店舗プロフィール編集',
          style: AppTextStyle.text14.copyWith(color: AppColors.mainTextColor),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Form(
              child: ResponsiveWidget(
                mobile: Column(
                  children: [
                    AppTextField(title: "店舗名*"),
                    SizedBox(
                      height: 15,
                    ),
                    AppTextField(title: "代表担当者名*"),
                    SizedBox(
                      height: 15,
                    ),
                    AppTextField(title: "店舗電話番号*"),
                    SizedBox(
                      height: 15,
                    ),
                    AppTextField(title: "店舗住所*"),
                  ],
                ),
                tab: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppTextField(title: "店舗名*"),
                        SizedBox(
                          width: 15,
                        ),
                        AppTextField(title: "代表担当者名*"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppTextField(title: "店舗電話番号*"),
                        SizedBox(
                          width: 15,
                        ),
                        AppTextField(title: "店舗住所*"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // GoogleMap(
            //   initialCameraPosition: CameraPosition(
            //       bearing: 192.8334901395799,
            //       target: LatLng(37.43296265331129, -122.08832357078792),
            //       tilt: 59.440717697143555,
            //       zoom: 19.151926040649414),
            // ),
            SizedBox(
              height: 10,
            ),
            _PhotosPicker(title: '店舗外観', secondeTitle: '（最大3枚まで）'),
            SizedBox(
              height: 16,
            ),

            _PhotosPicker(title: '店舗外観', secondeTitle: '（最大3枚まで）'),

            SizedBox(
              height: 16,
            ),

            _PhotosPicker(title: '店舗外観', secondeTitle: '（最大3枚まで）'),

            SizedBox(
              height: 20,
            ),

            CustomButton(),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}

/// A widget used for picking photos for the store images.
class _PhotosPicker extends StatelessWidget {
  /// Constructor for the [_PhotosPicker].
  const _PhotosPicker({
    super.key,
    required this.title,
    required this.secondeTitle,
  });

  /// The title of the photo picker.
  final String title;

  /// The additional information for the photo picker.
  final String secondeTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: title, style: AppTextStyle.text14),
              const TextSpan(
                text: '*',
                style: TextStyle(
                  color: Color(0xFFEA5307),
                  fontSize: 14,
                  fontFamily: 'Noto Sans JP',
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                  text: '（最大3枚まで）',
                  style: AppTextStyle.text14
                      .copyWith(color: const Color(0xFF9C9795))),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (index) => const ImagePickerWidget()),
        )
      ],
    );
  }
}
