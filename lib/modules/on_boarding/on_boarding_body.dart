import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planet_app/models/on_boarding_model.dart/on_boarding_model.dart';
import 'package:planet_app/shared/style/fonts/font_style.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key, required this.onBoardingModel});
  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Image.asset(
            onBoardingModel.image,
          ),
        ),
        Text(
          onBoardingModel.firstTitle,
          style: FontsClass.font20bold,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          onBoardingModel.secondTitle,
          style: FontsClass.font20bold,
        ),
        const SizedBox(
          height: 5,
        ),
        if (onBoardingModel.therdTitle != null)
          Text(
            onBoardingModel.therdTitle!,
            style: FontsClass.font20bold,
          ),
      ],
    );
  }
}
