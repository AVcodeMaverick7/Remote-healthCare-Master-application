import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/services/api_response.dart';

// Flutter API Request to Flask Application

class APIService {

  static const URL = 'http://10.0.2.2:5000/flutter_api';
  // static const URL = 'https://proceedit-har.herokuapp.com/flutter_api';
  static const headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  Future<ApiResponse> getAPIResponse(Map<String,dynamic> inputData) async {

    final response =
    await http.post(URL, headers: headers, body: json.encode(inputData));

    if (response.statusCode == 200) {
      print('CONNECTION TO REST API SUCCESSFUL');
      final jsonData = json.decode(response.body);
      return apiResponseFromJson(jsonData);
    }
    else {
      throw Exception('Connection Error: Unable to get Model Results');
    }
  }
}
