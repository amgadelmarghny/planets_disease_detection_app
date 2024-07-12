import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planet_app/models/plant_model.dart/plant_model.dart';
import 'package:planet_app/models/plant_rersult_model/plant_result_model.dart';
import 'package:planet_app/shared/constants.dart';
import 'package:planet_app/shared/enums.dart';
import 'package:planet_app/shared/services/api_services.dart';

part 'plant_state.dart';

class PlantCubit extends Cubit<PlantState> {
  final ApiServices _apiServices;
  PlantCubit(this._apiServices) : super(PlantInitial());

  late PlantModel selectedPlant;

  Map<String, dynamic> errorResult = {};

  List<PlantModel> plantList = [
    PlantModel(
      image: 'lib/asset/image/corn.png',
      name: 'Corn',
      type: PlantType.corn,
    ),
    PlantModel(
      image: 'lib/asset/image/grap.png',
      name: 'grapes',
      type: PlantType.grape,
    ),
    PlantModel(
      image: 'lib/asset/image/pepper.png',
      name: 'pepper',
      type: PlantType.pepper,
    ),
    PlantModel(
      image: 'lib/asset/image/potato.png',
      name: 'potato',
      type: PlantType.potato,
    ),
    PlantModel(
      image: 'lib/asset/image/tomato.png',
      name: 'tomato',
      type: PlantType.tomato,
    ),
  ];

  PlantResultModel? plantResultModel;

  Future<void> getResult({required PlantType type, required File image}) async {
    emit(GetResultLoading());
    
      String endPoint = _getEndpoint(type);

      FormData formData = FormData.fromMap(
        {
          'file': await MultipartFile.fromFile(image.path),
        },
      );
      var res = await _apiServices.post(
        endPoint: endPoint,
        data: formData,
      );
      if (res.data['status'] == 'success') {
        plantResultModel = PlantResultModel.fromJson(res.data);
        emit(GetResultSuccess());
      } else {
        // if the status is failed
        errorResult = {
          'plant': res.data['plant'],
          'message': res.data['message'],
        };
        plantResultModel = PlantResultModel.fromJson(res.data);
        emit(GetResultFailure(errMessage: res.data['message']));
      }
    
  }

  String _getEndpoint(PlantType type) {
    switch (type) {
      case PlantType.potato:
        return kPotato;
      case PlantType.tomato:
        return kTomato;
      case PlantType.grape:
        return kGrape;
      case PlantType.corn:
        return kCorn;
      case PlantType.pepper:
        return kPepper;
    }
  }

  late File plantImage;
  Future<void> pickImage({
    ImageSource source = ImageSource.camera,
  }) async {
    File? pickedImage;

    final returnImage = await ImagePicker().pickImage(source: source);

    if (returnImage == null) {
      emit(PickImageFailureState(errMessage: 'No image selected'));
      return;
    }
    pickedImage = File(returnImage.path);
    plantImage = pickedImage;
    emit(PickImageSuccessState(fileImage: pickedImage));
  }
}
