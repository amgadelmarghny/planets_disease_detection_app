// import 'package:flutter/material.dart';
// import 'package:planets_disease_detection_app/models/plant_model.dart/plant_model.dart';
// import 'package:planets_disease_detection_app/modules/plant/plant_info.dart';
// import 'package:planets_disease_detection_app/shared/components/back_icon.dart';

// class PlantView extends StatelessWidget {
//   const PlantView({super.key});
//   static const routeName = '/plant-view';
//   @override
//   Widget build(BuildContext context) {
//     final plantModel = ModalRoute.of(context)!.settings.arguments as PlantModel;
//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackIcon(),
//         title: Text(plantModel.name),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Description'),
//             SizedBox(height: 20),
//             CustomPlantInfo(text: null),
//             SizedBox(height: 20),
//             Text('Diseases'),
//             SizedBox(height: 20),
//             CustomPlantInfo(
//               text: null,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//}
