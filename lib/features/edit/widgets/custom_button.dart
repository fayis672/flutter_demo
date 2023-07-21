import 'package:flutter/material.dart';

/// A custom button widget with a specified `onTap` callback function.
class CustomButton extends StatelessWidget {
  /// Constructor for the [CustomButton].
  ///
  /// [onTap]: The callback function to be executed when the button is tapped.
  const CustomButton({super.key, this.onTap});

  /// The callback function to be executed when the button is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 335,
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          decoration: ShapeDecoration(
            color: const Color.fromARGB(255, 197, 191, 188),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            shadows: const [
              BoxShadow(
                color: Color(0x3FEE7D42),
                blurRadius: 15,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '編集を保存',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Noto Sans JP',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
