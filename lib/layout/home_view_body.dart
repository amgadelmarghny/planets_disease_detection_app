import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_app/modules/scan_result/scan_result.dart';
import 'package:planet_app/shared/bloc/plant_cubit/plant_cubit.dart';
import 'package:planet_app/shared/components/flutter_toast.dart';
import 'package:planet_app/shared/components/plant_item.dart';
import 'package:planet_app/shared/style/fonts/font_style.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlantCubit>();

    return BlocListener<PlantCubit, PlantState>(
      listener: (context, state) {
        if (state is PickImageFailureState) {
          showToast(msg: state.errMessage, toastState: ToastState.worrning);
          Navigator.pop(context);
        }
        if (state is PickImageSuccessState) {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            ScanResultView.routeName,
          );
          context.read<PlantCubit>().getResult(
                type: cubit.selectedPlant.type,
                image: context.read<PlantCubit>().plantImage,
              );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('lib/asset/image/home.png'),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 8,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/asset/image/scan_icon.webp',
                        height: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Choose plant',
                        style: FontsClass.font20bold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 1.6,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: cubit.plantList.length,
                    itemBuilder: (context, index) {
                      return PlantItem(
                        plantModel: cubit.plantList[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
