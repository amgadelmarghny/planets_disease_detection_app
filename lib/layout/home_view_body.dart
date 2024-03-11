import 'package:flutter/material.dart';

import '../models/plant_model.dart/plant_model.dart';
import '../shared/componants/plant_item.dart/plant_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<PlantModel> plantList = [
      PlantModel(image: 'lib/asset/image/corn.png', name: 'Corn'),
      PlantModel(image: 'lib/asset/image/grap.png', name: 'grap'),
      PlantModel(image: 'lib/asset/image/orange.png', name: 'orange'),
      PlantModel(image: 'lib/asset/image/peach.png', name: 'peach'),
      PlantModel(image: 'lib/asset/image/pepper.png', name: 'pepper'),
      PlantModel(image: 'lib/asset/image/potato.png', name: 'potato'),
      PlantModel(image: 'lib/asset/image/squash.png', name: 'squash'),
      PlantModel(image: 'lib/asset/image/strawberry.png', name: 'strawberry'),
      PlantModel(image: 'lib/asset/image/tomato.png', name: 'tomato'),
      PlantModel(image: 'lib/asset/image/corn.png', name: 'apple'),
    ];
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 1.5),
              itemCount: plantList.length,
              itemBuilder: (context, index) {
                return PlantItem(
                  plantModel: plantList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
