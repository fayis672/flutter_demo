import 'package:demo/utils/contants/text_style.dart';
import 'package:demo/utils/responsive.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.title});

  final String title;

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
            ],
          ),
        ),
        TextField(
          style: AppTextStyle.text12,
          decoration: InputDecoration(
              constraints: BoxConstraints(
                  minWidth: 100,
                  maxWidth: ResponsiveWidget.isMobile(context)
                      ? double.infinity
                      : 335),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 0.50, color: Color(0xFFE8E8E8)),
              )),
        )
      ],
    );
  }
}
