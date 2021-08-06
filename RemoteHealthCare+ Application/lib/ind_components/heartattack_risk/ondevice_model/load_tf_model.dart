import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:math';

Future<List> standardizeData(inputData) async {

  List<double> scaledData = [];

  // Loading Original Dataset
  // final loadCSVdata = await rootBundle.loadString('assets/subset_ch_copy.csv');
  // // print(loadCSVdata);

  // Means and Standard deviation from Original Dataset
  List<double> means = [237.512, 3.243, 12.696, 12.318, 0.599, 0.674, 0.607, 5.071, 0.891, 0.287, 0.668, 8.189, 5.1, 2.444, 0.255, 0.35, 0.324, 0.39, 136.909, 1.786, 54.288, 0.181];
  List<double> standardDeviation =  [56.4, 0.927, 15.225, 13.745, 0.49, 0.469, 0.806, 4.244, 1.021, 0.453, 0.937, 4.119, 1.915, 3.563, 0.436, 0.477, 0.468, 0.488, 25.219, 0.622, 55.988, 0.386];
  // def standardize_data(input_data,means,std):
  for ( int i =0; i < inputData.length; i++) {
    scaledData.add(((inputData[i] - means[i]) / standardDeviation[i]));
  }
  return scaledData;
}

double roundDouble(double value, int places){
  double mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

Future<dynamic> loadModel(savedData) async{

  try {
// Create interpreter from asset.
    Interpreter interpreter =
    await Interpreter.fromAsset("assets/proceedit_har_adam_tflite_model_2L_1D40_9856_9257.tflite");

    // interpreter.allocateTensors();
    // Get input and output tensors.
    // var inputDetails = interpreter.getInputTensors();
    // var outputDetails = interpreter.getOutputTensors();
    // var input_shape = input_details[0]['shape'];
    // print('---Loading Input details-----');
    // print(inputDetails);
    // print('---Loading Output details----');
    // print(outputDetails);

    var tempD  = savedData;

    var inputD = [233.0, 1.0, 50.0, 20.0, 1.0, 1.0, 2.0, 1.0, 2.3, 0.0, 0.0, 10.5, 6.0, 6.0, 0.0, 0.0, 0.0, 0.0, 150.0, 3.0, 172.0, 0.0];
    var input1 = [207.0, 4.0, 20.0, 15.0, 0.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0, 7.0, 7.0, 0.0, 0.0, 0.0, 0.0, 1.0, 168.0, 1.0, 170.0, 0.0];
    var input2 = [282.0, 1.0, 20.0, 7.0, 1.0, 0.0, 2.0, 1.0, 1.4, 0.0, 1.0, 10.0, 3.0, 9.0, 1.0, 0.0, 0.0, 0.0, 174.0, 2.0, 83.0, 0.0];
    var input3 = [228.0, 4.0, 5.0, 5.0, 1.0, 1.0, 0.0, 9.0, 0.0, 1.0, 0.0, 10.0, 6.0, 0.0, 0.0, 1.0, 0.0, 0.0, 140.0, 2.0, 6.0, 0.0];
    var input4 = [126.0, 3.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.2, 0.0, 1.0, 11.0, 7.0, 0.5, 0.0, 0.0, 0.0, 0.0, 173.0, 1.0, 180.0, 0.0];
    var input5 = [291.0, 1.0, 5.0, 5.0, 0.0, 0.0, 1.0, 8.0, 0.0, 1.0, 0.0, 13.0, 3.0, 0.0, 1.0, 0.0, 0.0, 0.0, 155.0, 2.0, 15.0, 0.0];
    var input6 = [240.0, 3.0, 20.0, 40.0, 0.0, 0.0, 2.0, 1.0, 0.6, 0.0, 0.0, 6.5, 7.0, 6.0, 0.0, 0.0, 0.0, 1.0, 154.0, 2.0, 97.0, 0.0];

    // STANDARDIZING INPUT DATA
    final scaledInput = await standardizeData(tempD);

    // INPUT DATA AFTER STANDARD SCALING
    // print('INPUT DATA');
    var inputData = [scaledInput];

    // OUTPUT SHAPE
    var outputData = List(1).reshape([1,1]);

    // ALLOCATING TENSORS
    // print('ALLOCATING TENSORS');
    interpreter.allocateTensors();

    // INVOKING INTERPRETER
    // print('INVOKING INTERPRETER');
    interpreter.invoke();

    // RUNNING THE MODEL
    // print('RUNNING THE MODEL');
    interpreter.run(inputData,outputData);

    // CLOSING THE INTERPRETER
    interpreter.close();

    return roundDouble(outputData[0][0]*100,0);

  } catch (e) {
    print('Error loading model: ' + e.toString());
  }

}





