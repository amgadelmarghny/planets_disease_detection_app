part of 'plant_cubit.dart';

@immutable
sealed class PlantState {}

final class PlantInitial extends PlantState {}

final class PickImageSuccessState extends PlantState {
  final File fileImage;

  PickImageSuccessState({required this.fileImage});
}

final class PickImageFailureState extends PlantState {
  final String errMessage;

  PickImageFailureState({required this.errMessage});
}
