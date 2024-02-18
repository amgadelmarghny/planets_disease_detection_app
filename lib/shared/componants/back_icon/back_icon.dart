import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'lib/asset/image/arrow_back.svg',
          ),
        ],
      ),
    );
  }
}