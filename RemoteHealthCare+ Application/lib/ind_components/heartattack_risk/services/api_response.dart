// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    this.noDiseaseProb,
    this.diseaseProb,
  });

  double noDiseaseProb;
  double diseaseProb;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    noDiseaseProb: json["NoDiseaseProb"],
    diseaseProb: json["DiseaseProb"],
  );

  Map<String, dynamic> toJson() => {
    "NoDiseaseProb": noDiseaseProb,
    "DiseaseProb": diseaseProb,
  };
}