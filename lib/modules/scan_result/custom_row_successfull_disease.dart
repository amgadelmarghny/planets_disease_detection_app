import 'package:flutter/material.dart';
import 'package:planet_app/shared/style/colors/colors_style.dart';

class CustomRowSuccessfulDisease extends StatelessWidget {
  const CustomRowSuccessfulDisease({
    super.key,
    required this.success,
  });

  final bool success;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        success
            ? const CircleAvatar(
                radius: 13,
                backgroundColor: Color(0xffD8F2C6),
                child: Icon(
                  Icons.check,
                  color: defaultColor,
                  size: 20,
                ),
              )
            : const Icon(
                Icons.error,
                color: Colors.red,
                size: 26,
              ),
        const SizedBox(
          width: 18,
        ),
        FittedBox(
        
          child: Text(
            success
                ? 'Successful Disease Identification'
                : 'Failed identification',
            style:  TextStyle(fontWeight: FontWeight.w500, fontSize: 17,color:success ? null: Colors.red ),
          ),
        ),
      ],
    );
  }
}
