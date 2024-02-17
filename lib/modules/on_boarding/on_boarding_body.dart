import 'package:flutter/material.dart';
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
        Image.asset(
          onBoardingModel.image,
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          onBoardingModel.firstTitle,
          style: FontsClass.font24bold,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          onBoardingModel.secondTitle,
          style: FontsClass.font24bold,
        ),
        const SizedBox(
          height: 10,
        ),
        if (onBoardingModel.therdTitle != null)
          Text(
            onBoardingModel.therdTitle!,
            style: FontsClass.font24bold,
          ),
      ],
    );
  }
}
