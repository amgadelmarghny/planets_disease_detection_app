import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planet_app/shared/componants/custom_button.dart';
import 'package:planet_app/shared/componants/plant_item/plant_item.dart';
import 'package:planet_app/shared/style/fonts/font_style.dart';

import '../models/plant_model.dart/plant_model.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
      PlantModel(image: 'lib/asset/image/apple.png', name: 'apple'),
    ];
    return Column(
      children: [
        Image.asset('lib/asset/image/home.png'),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(50)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomButton(
                  text: 'Detect Now',
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      context: context,
                      builder: (contex) => const DetextionOptions(),
                    );
                  },
                ),
                const SizedBox(height: 30),
                const Text(
                  'My plants',
                  style: FontsClass.font20bold,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2 / 1.9,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20),
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
          ),
        )
      ],
    );
  }
}

class DetextionOptions extends StatelessWidget {
  const DetextionOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(text: 'Choose from Gallery'),
          SizedBox(height: 20),
          CustomButton(text: 'Choose from Gallery'),
        ],
      ),
    );
  }
}
