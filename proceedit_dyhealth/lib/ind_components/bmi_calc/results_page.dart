import 'package:flutter/material.dart';
import 'package:proceedit_dyhealth/ind_components/bmi_calc/bconstants.dart';
import 'package:proceedit_dyhealth/ind_components/bmi_calc/reusable_card.dart';
import 'package:proceedit_dyhealth/ind_components/bmi_calc/calculate_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage(
      {@required this.bmiResult,
        @required this.resultText,
        @required this.interpretation,
        @required this.getImage});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  final Image getImage;

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(
            '   Easy BMI Calculator',
            style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: loading,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: Colors.white,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 400.0,
                        height: 300.0,
                        child: widget.getImage,
                      ),
                      Text(
                        ' RESULT : ${widget.resultText.toUpperCase()} ',
                        style: TextStyle(
                          color: widget.resultText.contains('Normal')
                              ? Colors.green
                              : Color(0xFFfa0505),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.bmiResult,
                        style: TextStyle(
                          color: widget.resultText.contains('Normal')
                              ? Colors.green
                              : Color(0xFFfa0505),
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.interpretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonTitle: 'RE-CALCULATE')
            ],
          ),
        ),);
  }
}
