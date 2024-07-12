import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_app/layout/home_view.dart';
import 'package:planet_app/modules/on_boarding/on_boarding_view.dart';
import 'package:planet_app/modules/scan_result/scan_result.dart';
import 'package:planet_app/shared/bloc/app_cubit/app_cubit.dart';
import 'package:planet_app/shared/bloc/plant_cubit/plant_cubit.dart';
import 'package:planet_app/shared/cash_helper/cash_helper.dart';
import 'package:planet_app/shared/constants.dart';
import 'package:planet_app/shared/services/api_services.dart';
import 'package:planet_app/shared/style/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const PlanetApp());
}

class PlanetApp extends StatelessWidget {
  const PlanetApp({super.key});
  @override
  Widget build(BuildContext context) {
    bool? onBoardingCashe = CacheHelper.getData(kOnBoardingKey);
    late String routeName;
    if (onBoardingCashe == null) {
      routeName = OnBoardingView.routeName;
    } else {
      routeName = HomeView.routeName;
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => PlantCubit(ApiServices(Dio())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Planet Disease",
        theme: ThemeApp.lightTheme(),
        initialRoute: routeName,
        routes: {
          OnBoardingView.routeName: (context) => const OnBoardingView(),
          HomeView.routeName: (context) => const HomeView(),
          ScanResultView.routeName: (context) => const ScanResultView(),
          //  PlantView.routeName: (context) => const PlantView(),
        },
      ),
    );
  }
}
