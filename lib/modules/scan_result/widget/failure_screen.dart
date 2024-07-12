import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_app/modules/scan_result/custom_row_successfull_disease.dart';
import 'package:planet_app/shared/bloc/plant_cubit/plant_cubit.dart';
import 'package:planet_app/shared/style/fonts/font_style.dart';

class FailureResultScreen extends StatelessWidget {
  const FailureResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlantCubit>();
    return SafeArea(
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            width: MediaQuery.of(context).size.height,
            child: Image.file(
              fit: BoxFit.fill,
              cubit.plantImage,
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomRowSuccessfulDisease(
                  success: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'PLANT NAME',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${cubit.errorResult['plant']}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey, fontSize: 23),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Description:',
                  style: FontsClass.font20bold.copyWith(fontSize: 23),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    '${cubit.errorResult['message']}',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: FontsClass.font20think,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
