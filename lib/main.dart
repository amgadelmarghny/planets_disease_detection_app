import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_app/modules/on_boarding/on_boarding.dart';
import 'package:planet_app/shared/bloc/app_cubit/app_cubit.dart';
import 'package:planet_app/shared/style/theme/theme.dart';

void main() {
  runApp(const PlanetApp());
}

class PlanetApp extends StatelessWidget {
  const PlanetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        theme: ThemeApp.lightTheme(),
        initialRoute: OnBoardingView.id,
        routes: {
          OnBoardingView.id: (context) => const OnBoardingView(),
        },
      ),
    );
  }
}
