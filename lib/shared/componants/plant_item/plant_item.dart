import 'package:flutter/material.dart';
import 'package:planet_app/models/plant_model.dart/plant_model.dart';

class PlantItem extends StatelessWidget {
  const PlantItem({
    super.key,
    required this.plantModel,
  });
  final PlantModel plantModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Image.asset(
            plantModel.image,
          ),
          Text(
            plantModel.name,
          ),
        ],
      ),
    );
  }
}
