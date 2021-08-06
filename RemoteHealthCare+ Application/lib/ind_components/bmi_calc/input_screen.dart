import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proceedit_dyhealth/ind_components/bmi_calc/reusable_card.dart';
import 'package:proceedit_dyhealth/ind_components/bmi_calc/bconstants.dart';
import 'package:proceedit_dyhealth/ind_components/bmi_calc/results_page.dart';
import 'package:proceedit_dyhealth/ind_components/bmi_calc/icon_content.dart';
import 'package:proceedit_dyhealth/ind_components/bmi_calc/calculate_button.dart';
import 'package:proceedit_dyhealth/ind_components/bmi_calc/bmi_model.dart';

enum Gender { male, female }

class InputScreen extends StatefulWidget {
  static const String id = 'input_screen';

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputScreen> {
  int _selectedIndex = 0;
  Gender selectedGender;
  int height = 150;
  int weight = 45;
  bool weightSwitch = false;

  // DEFAULT WEIGHT METRIC
  String weightMetric = 'kg';
  List weightMetrics = ['kg', 'lbs'];

  void _onItemTapped(int index) {
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        // leading: Transform.scale(
        //   scale: 3.1,
        //   child: Container(
        //     padding: EdgeInsets.only(left: 20.0),
        //     child: Image.asset(
        //       'lib/ind_components/bmi_calc/images/logo.png',
        //       fit: BoxFit.fitWidth,
        //     ),
        //   ),
        // ),
        // //),
        title: Text(
          '   Easy BMI Calculator',
          style: TextStyle(
              fontFamily: 'Merriweather',
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kMActiveCardColour
                        : null,
                    cardChild: IconContent(
                      fontIcon: FontAwesomeIcons.male,
                      label: 'MALE',
                      colour: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      fontIcon: FontAwesomeIcons.female,
                      label: 'FEMALE',
                      colour: Colors.pink,
                    ),
                    colour: selectedGender == Gender.female
                        ? kFActiveCardColour
                        : null,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 100.0,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'lbs',
                            style: kLabelTextStyle,
                          ),
                          Switch(
                              value: weightSwitch,
                              onChanged: (value) {
                                setState(
                                      () {
                                    if (value) {
                                      weightSwitch = value;
                                      weightMetric = weightMetrics[1];
                                    } else {
                                      weightSwitch = value;
                                      weightMetric = weightMetrics[0];
                                    }
                                  },
                                );
                              }),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        weightMetric, // DEFAULT METRIC
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFF7e4b9c),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Colors.deepPurple,
                      overlayColor: Color(0xFFc28de0),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                        value: weight.toDouble(),
                        min: 0.0,
                        max: 300.0,
                        onChanged: (double newWeight) {
                          setState(() {
                            weight = newWeight.round();
                          });
                        }),
                  )
                ],
              ),
              colour: kHActiveCardColour,
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFF7e4b9c),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Colors.deepPurple,
                      overlayColor: Color(0xFFc28de0),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 250.0,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        }),
                  )
                ],
              ),
              colour: kHActiveCardColour,
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              BMICalculator calc =
              BMICalculator(height: height, weight: weight);
              setState(() {
                if (weightMetric == weightMetrics[1]) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.getBMIValue(pounds: true),
                        resultText: calc.getBMITextResult(),
                        interpretation: calc.getBMIInterpretation(),
                        getImage: calc.getImage(),
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.getBMIValue(),
                        resultText: calc.getBMITextResult(),
                        interpretation: calc.getBMIInterpretation(),
                        getImage: calc.getImage(),
                      ),
                    ),
                  );
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
