import 'dart:io';

import 'package:demo/utils/contants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/contants/color.dart';

/// A widget that allows the user to pick an image from the gallery.
class ImagePickerWidget extends StatefulWidget {
  /// Constructor for the [ImagePickerWidget].
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  String? imagePath;

  /// Function to pick an image from the gallery.
  pickImage() async {
    final ImagePicker picker = ImagePicker();
    var xfile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagePath = xfile?.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImage,
      child: Stack(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xFFE7E7E7)),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: imagePath == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/image_place.svg'),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        '写真を追加',
                        style: AppTextStyle.text12
                            .copyWith(color: const Color(0xFF9C9795)),
                      )
                    ],
                  )
                : Image.file(
                    File(imagePath!),
                    fit: BoxFit.cover,
                  ),
          ),
          Visibility(
            visible: imagePath != null,
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      imagePath = null;
                    });
                  },
                  icon: Icon(
                    Icons.close,
                    color: AppColors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
