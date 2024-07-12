class PlantResultModel {
  double? confidence;
  DiseaseInfo? diseaseInfo;
  String? plant;
  String? predictedClass;
  String? status;

  PlantResultModel(
      {this.confidence,
      this.diseaseInfo,
      this.plant,
      this.predictedClass,
      this.status});

  PlantResultModel.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
    diseaseInfo = json['disease_info'] != null
        ? DiseaseInfo.fromJson(json['disease_info'])
        : null;
    plant = json['plant'];
    predictedClass = json['predicted_class'];
    status = json['status'];
  }
}

class DiseaseInfo {
  String? arabicName;
  List<String>? controlMethods;
  String? disease;
  List<String>? favorableConditions;
  String? pathogen;
  String? plant;
  List? symptoms;

  DiseaseInfo(
      {this.arabicName,
      this.controlMethods,
      this.disease,
      this.favorableConditions,
      this.pathogen,
      this.plant,
      this.symptoms});

  DiseaseInfo.fromJson(Map<String, dynamic> json) {
    arabicName = json['arabic_name'];
    controlMethods = json['control_methods'].cast<String>();
    disease = json['disease'];
    favorableConditions = json['favorable_conditions'].cast<String>();
    pathogen = json['pathogen'];
    plant = json['plant'];
    if (json['symptoms'] != null) {
      symptoms = json['symptoms'].cast<String>();
    }
  }
}
