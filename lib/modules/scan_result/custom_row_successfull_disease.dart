import 'package:flutter/material.dart';
import 'package:planet_app/shared/style/colors/colors_style.dart';

class CustomRowSuccessfulDisease extends StatelessWidget {
  const CustomRowSuccessfulDisease({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 13,
          backgroundColor: Color(0xffD8F2C6),
          child: Icon(
            Icons.check,
            color: defaultColor,
            size: 20,
          ),
        ),
        SizedBox(
          width: 18,
        ),
        Text(
          'Successful Disease Identification',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ],
    );
  }
}
