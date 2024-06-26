import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomRowDirections extends StatelessWidget {
  const CustomRowDirections({
    super.key,
    this.svgPic,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.primaryColor,
    this.image,
  });
  final String? image;
  final String? svgPic;
  final String title;
  final String subTitle;
  final Color color;
  final Color primaryColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primaryColor,
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (svgPic != null)
                    SvgPicture.asset(
                      svgPic!,
                      height: 32,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  if (image != null)
                    Image.asset(
                      image!,
                      height: 32,
                      color: color,
                    )
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 17,
                  ),
                ),
                Expanded(
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    subTitle,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
