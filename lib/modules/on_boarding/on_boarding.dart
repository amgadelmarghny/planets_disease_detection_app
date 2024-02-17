import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planet_app/models/on_boarding_model.dart/on_boarding_model.dart';
import 'package:planet_app/modules/on_boarding/on_boarding_body.dart';
import 'package:planet_app/shared/bloc/app_cubit/app_cubit.dart';
import 'package:planet_app/shared/componants/custom_button.dart';
import 'package:planet_app/shared/style/colors/colors_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static String id = 'OnBoarding';

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> onBoardingList =
        BlocProvider.of<AppCubit>(context).onBoardingList;
    PageController pageController = PageController();
    return BlocProvider(
      create: (context) => AppCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: defaultColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'lib/asset/image/arrow_back.svg',
                ),
              ],
            ),
          ),
        ),
        backgroundColor: defaultColor,
        body: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 50, bottom: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        BlocProvider.of<AppCubit>(context).changeOnBoard(index);
                      },
                      itemCount: onBoardingList.length,
                      controller: pageController,
                      itemBuilder: (contex, index) {
                        return OnBoardingViewBody(
                          onBoardingModel: onBoardingList[index],
                        );
                      },
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: BlocProvider.of<AppCubit>(context)
                        .onBoardingList
                        .length,
                    effect: const ScaleEffect(
                      activeDotColor: primaryColor,
                      dotColor: Colors.white,
                      dotWidth: 20,
                      dotHeight: 20,
                      radius: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    onTap: () {
                      if (BlocProvider.of<AppCubit>(context)
                              .onBoardingPageNum ==
                          onBoardingList.length - 1) {
                      } else {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      }
                    },
                    text:
                        BlocProvider.of<AppCubit>(context).onBoardingPageNum ==
                                (BlocProvider.of<AppCubit>(context)
                                        .onBoardingList
                                        .length -
                                    1)
                            ? 'Get Started'
                            : 'next',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}