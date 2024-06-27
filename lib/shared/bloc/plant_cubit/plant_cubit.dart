import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'plant_state.dart';

class PlantCubit extends Cubit<PlantState> {
  PlantCubit() : super(PlantInitial());

  Future<File?> pickImageFromCamera() async {
    File? pickedImage;

    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) {
      emit(PickImageFailureState(errMessage: 'No image selected'));
      return null;
    }
    pickedImage = File(returnImage.path);
    emit(PickImageSuccessState(fileImage: pickedImage));
    return pickedImage;
    // Navigator.pushNamed(
    //   context,
    //   ScanResult.routeName,
    //   arguments: pickedImage,
    // );
  }

  Future<File?> pickImageFromGallery() async {
    File? pickedImage;

    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      emit(PickImageFailureState(errMessage: 'No image selected'));
      return null;
    }
    pickedImage = File(returnImage.path);
    emit(PickImageSuccessState(fileImage: pickedImage));
    return pickedImage;
    // Navigator.pushNamed(
    //   context,
    //   ScanResult.routeName,
    //   arguments: _pickedImage,
    // );
  }
}
