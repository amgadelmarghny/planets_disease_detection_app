import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_app/layout/home_view.dart';
import 'package:planet_app/models/on_boarding_model.dart/on_boarding_model.dart';
import 'package:planet_app/modules/on_boarding/on_boarding_body.dart';
import 'package:planet_app/shared/bloc/app_cubit/app_cubit.dart';
import 'package:planet_app/shared/components/nav_and_remove.dart';
import 'package:planet_app/shared/style/colors/colors_style.dart';
import 'package:planet_app/shared/style/fonts/font_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static String routeName = 'OnBoarding';

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> onBoardingList =
        BlocProvider.of<AppCubit>(context).onBoardingList;
    PageController pageController = PageController();
    double h = MediaQuery.sizeOf(context).height;
    return BlocProvider(
      create: (context) => AppCubit(),
      child: Scaffold(
        body: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
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
                      itemBuilder: (context, index) {
                        return OnBoardingViewBody(
                          onBoardingModel: onBoardingList[index],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: h * .2),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: BlocProvider.of<AppCubit>(context)
                        .onBoardingList
                        .length,
                    effect: const ExpandingDotsEffect(
                      expansionFactor: 7,
                      activeDotColor: defaultColor,
                      dotColor: defaultColor,
                      spacing: 5,
                      dotHeight: 8,
                      dotWidth: 7,
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          customNavAndRemove(context,
                              routeName: HomeView.routeName);
                        },
                        child:
                            const Text('Skip', style: FontsClass.font20think),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          if (BlocProvider.of<AppCubit>(context)
                                  .onBoardingPageNum ==
                              BlocProvider.of<AppCubit>(context)
                                      .onBoardingList
                                      .length -
                                  1) {
                            customNavAndRemove(context,
                                routeName: HomeView.routeName);
                          }
                          {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          }
                        },
                        child:
                            const Text('Next', style: FontsClass.font20think),
                      ),
                    ],
                  ),
                  SizedBox(height: h * .06),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
