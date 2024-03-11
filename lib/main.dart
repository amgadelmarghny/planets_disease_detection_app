import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_app/layout/home_view.dart';
import 'package:planet_app/modules/on_boarding/on_boarding_view.dart';
import 'package:planet_app/shared/bloc/app_cubit/app_cubit.dart';
import 'package:planet_app/shared/cash_helper/cash_helper.dart';
import 'package:planet_app/shared/style/theme/theme.dart';
import 'modules/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const PlanetApp());
}

class PlanetApp extends StatelessWidget {
  const PlanetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Planet Disease",
        theme: ThemeApp.lightTheme(),
        home: const SplashScreen(),
        routes: {
          OnBoardingView.id: (context) => const OnBoardingView(),
          HomeView.id: (context) => const HomeView(),
        },
      ),
    );
  }
}
