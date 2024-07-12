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

final class GetResultLoading extends PlantState {}

final class GetResultSuccess extends PlantState {}

final class GetResultFailure extends PlantState {
  final String errMessage;

  GetResultFailure({required this.errMessage});
}

final class ErrorResult extends PlantState {
  final String errMessage;

  ErrorResult({required this.errMessage});
}


