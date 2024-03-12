import 'package:flutter/material.dart';
import 'package:planet_app/models/plant_model.dart/plant_model.dart';
import 'package:planet_app/modules/plant/plant_view.dart';

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
        Navigator.pushNamed(
          context,
          PlantView.routeName,
          arguments: plantModel,
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
            ),
          ],
        ),
      ),
    );
  }
}
