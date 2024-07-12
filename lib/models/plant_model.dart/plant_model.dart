import 'package:planet_app/shared/enums.dart';

class PlantModel {
  final String image;
  final String name;
  final PlantType type;
  PlantModel({
    required this.image,
    required this.name,
    required this.type,
  });
}
