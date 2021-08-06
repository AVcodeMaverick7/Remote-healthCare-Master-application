import 'package:flutter/material.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/views/bottom_button.dart';

class ResultsPage extends StatefulWidget {

  double noDiseaseProb;
  double diseaseProb;
  Image imageFile;
  String interpretation;
  ResultsPage({@required this.noDiseaseProb,@required this.diseaseProb,this.imageFile, @required this.interpretation});

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Text('Your Results'),
          backgroundColor: Colors.lightBlue),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.lightBlue,
                    width: 450.0,
                    height: 200.0,
                    child: widget.imageFile,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  ),
                  ),
                  Text('${widget.interpretation.toString().toUpperCase()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.noDiseaseProb > 50 ? Colors.green
                        : Color(0xFFfa0505),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(
                    ' No Disease Probability : ${widget.noDiseaseProb.toString().toUpperCase()} % ',
                    style: TextStyle(
                      color: widget.noDiseaseProb > 50
                          ? Colors.green
                          : Color(0xFFfa0505),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Disease Probability : ${widget.diseaseProb.toString().toUpperCase()} %',
                    style: TextStyle(
                      color: widget.diseaseProb > 50
                          ? Color(0xFFfa0505)
                          : Colors.green,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(
                  //   widget.interpretation,
                  //   style: kBodyTextStyle,
                  //   textAlign: TextAlign.center,
                  // ),
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE',
            onTap: () {
            //  NAAVIGATIN TO MAIN PAGE
            Navigator.pop(context);

            }


          )
        ],
      ),
    );
  }
}
