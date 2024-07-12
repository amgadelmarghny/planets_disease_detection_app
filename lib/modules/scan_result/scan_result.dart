import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_app/modules/scan_result/widget/failure_screen.dart';
import 'package:planet_app/shared/bloc/plant_cubit/plant_cubit.dart';
import 'package:planet_app/shared/style/colors/colors_style.dart';
import 'widget/success_screen.dart';


class ScanResultView extends StatelessWidget {
  const ScanResultView({super.key});

  static const String routeName = '/scan_result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlantCubit, PlantState>(
        builder: (context, state) {
          if (state is GetResultSuccess) {
            return const SuccessResultScreen();
          } else if (state is GetResultFailure) {
            return const FailureResultScreen();
          } else if (state is ErrorResult) {
            return Center(
              child: Text(
                state.errMessage,
                style: const TextStyle(color: Colors.red, fontSize: 24),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: defaultColor,
              ),
            );
          }
        },
      ),
    );
  }
}
