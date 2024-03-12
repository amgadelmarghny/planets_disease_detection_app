import 'package:flutter/material.dart';
import 'package:planet_app/shared/style/colors/colors_style.dart';
import 'package:planet_app/shared/style/fonts/font_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.width = double.infinity,
  });
  final String text;
  final void Function()? onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: width,
        decoration: BoxDecoration(
          color: defaultColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (width == double.infinity)
              Image.asset(
                'lib/asset/image/scan_icon.webp',
                height: 32,
                color: Colors.white,
              ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: FontsClass.font20bold.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
