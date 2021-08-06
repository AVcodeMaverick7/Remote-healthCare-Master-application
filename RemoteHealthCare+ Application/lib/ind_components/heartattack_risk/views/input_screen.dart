import 'package:proceedit_dyhealth/ind_components/heartattack_risk/services/api_response.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/services/api_service.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/models/myVariables.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/models/textFormValidation.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/views/results_page.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/views/generate_form.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/views/bottom_button.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/views/info_panel.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/ondevice_model/load_tf_model.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class MyForm extends StatefulWidget {
  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MyForm> {

  // CREAING MODEL OBJECT FOR RESULTS PAGE
  ClassifyDisease result = ClassifyDisease();

  final sendRequest = APIService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  //Building the Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: Transform.scale(
          scale: 2.75,
          child: Container(
            padding: EdgeInsets.only(left: 20.0),
            // child: Image.asset(
            //   'images/logo.png',
            //   fit: BoxFit.fitWidth,
            // ),
          ),
        ),
        title: Text('\t \tHeart Attack Risk Predictor'),
        actions: [
      IconButton(
        icon: const Icon(Icons.info_outline),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPanel()));
        },
      ),],
      ),

      //Building scrolling Scaffold
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: getForms(),),
                ),
              ),

              BottomButton(
                buttonTitle: 'SUBMIT',
                  onTap: () async {

                    var connectivityResult = await (Connectivity().checkConnectivity());

                    if (_formKey.currentState.validate())
                    {
                      // PRINTING COLLECTED FORM DATA FROM TEXTFORM VALIDATION PAGE
                      print('***** ORIGINAL INPUT DATA *****');
                      print(savedData);

                      // dismiss keyboard during async call
                      FocusScope.of(context).requestFocus(new FocusNode());

                      // start the modal progress HUD
                      setState(() {
                        _loading = true;
                      });

                      // CHECK NETWORK CONNECTIVITY
                      // IF CONNECTED, CALL THE REST API AND UPDATE THE DATABASE
                      // IF NO CONNECTION, CALL THE ON-DEVICE MODEL

                      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {

                        print('CONNECTED TO MOBILE/WIFI NETWORK & FETCHING RESULTS FROM API');

                        // CALLING THE REST API SERVICE HOSTED ON FLASK WEB APPLICATION
                        final ApiResponse modelOutput = await sendRequest.getAPIResponse(savedData);
                        setState(() {
                          print(modelOutput.noDiseaseProb);
                          print(modelOutput.diseaseProb);
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              ResultsPage(noDiseaseProb: modelOutput.noDiseaseProb, diseaseProb: modelOutput.diseaseProb,
                                imageFile: result.getImage(modelOutput.noDiseaseProb),
                              interpretation: result.getInterpretation(modelOutput.noDiseaseProb),),),);
                          // _formKey.currentState.reset();
                          _loading = false;
                        });
                      }
                      else {

                        print('NOT CONNECTED TO INTERNET & FETCHING RESULTS FROM ON-DEVICE MODEL');

                        // Converting the string input into double
                        List<double> onDeviceInput = savedData.values.map((e) => double.parse(e)).toList();
                        print('***** TRANSFORMED INPUT DATA *****');
                        print(onDeviceInput);

                        // CALLING THE ON-DEVICE MACHINE LEARNING MODEL
                        final diseaseProb = await loadModel(onDeviceInput);
                        var noDiseaseProb = 100 - diseaseProb;
                        if (diseaseProb !=Null) {
                          print('NO DISEASE PROBABILITY is $noDiseaseProb %');
                          print('DISEASE PROBABILITY    is $diseaseProb %');
                        }
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              ResultsPage(noDiseaseProb: noDiseaseProb, diseaseProb: diseaseProb,
                                imageFile: result.getImage(noDiseaseProb),
                                interpretation: result.getInterpretation(noDiseaseProb),),),);
                          // _formKey.currentState.reset();
                          _loading = false;
                        });
                      }
                    }   // end form button press validation
                    else {
                      print('PLEASE VERIFY YOUR ANSWERS');
                    }
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}