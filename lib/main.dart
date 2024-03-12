import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_app/layout/home_view.dart';
import 'package:planet_app/modules/on_boarding/on_boarding_view.dart';
import 'package:planet_app/modules/plant/plant_view.dart';
import 'package:planet_app/modules/scan_result/Scan_result.dart';
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
          OnBoardingView.routeName: (context) => const OnBoardingView(),
          HomeView.routeName: (context) => const HomeView(),
          ScanResult.routeName: (context) => const ScanResult(),
          PlantView.routeName: (context) => const PlantView(),
        },
      ),
    );
  }
}
