import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_app/layout/detection_bottom_sheet.dart';
import 'package:planet_app/models/plant_model.dart/plant_model.dart';
import 'package:planet_app/shared/bloc/plant_cubit/plant_cubit.dart';

class PlantItem extends StatelessWidget {
  const PlantItem({
    super.key,
    required this.plantModel,
  });
  final PlantModel plantModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PlantCubit>().selectedPlant = plantModel;
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          context: context,
          builder: (context) => const DetectionOptions(),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              spreadRadius: 2,
              color: Colors.grey.withOpacity(0.4),
            )
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              plantModel.image,
              fit: BoxFit.cover,
            ),
            Text(
              plantModel.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
