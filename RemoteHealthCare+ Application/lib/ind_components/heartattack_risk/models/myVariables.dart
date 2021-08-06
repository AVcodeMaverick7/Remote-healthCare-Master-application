import 'package:flutter/material.dart';

// DISEASE CLASSIFICATION FOR RESULTS PAGE
class ClassifyDisease {
  double noDisease;
  double disease;

  ClassifyDisease({this.noDisease,this.disease});

  Image getImage(double noDisease) {
    if (noDisease > 50) {
      return Image.asset('lib/ind_components/heartattack_risk/images/norisk2.png', fit: BoxFit.contain);
    } else {
      return Image.asset('lib/ind_components/heartattack_risk/images/risk1.png', fit: BoxFit.contain);
    }
  }

  String getInterpretation(double noDisease) {
    if (noDisease > 50) {
      return 'Congrats,You have a Healthy Heart!';
    }
    else {
      return 'Your Heart Maybe at Risk, Please consult Doctor for Checkup!';
    }
  }

}

// BUTTON CONSTANTS
const kBottomContainerHeight = 50.0;
const kBottomContainerColour = Colors.deepPurple;

const kLargeButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);


List<String> variableLabels = ['Serum cholesterol in mg/dl (CHOL)',
  'Chest pain type number (CP)',
  'Cigarettes per day (CIGS)',
  'Number of years as a smoker (YEARS)',
  'Provoked by exertion number (PAINEXER)',
  'Relieved after rest number (RELREST)',
  'Resting ECG result (RESTECG)',
  'Exercise protocol (PROTO)',
  'Exercise-induced ST depression relative to rest (OLDPEAK)',
  'Circumflex (CXMAIN)',
  'Number of major vessels colored by fluoroscopy (CA)',
  'Duration of exercise test in minutes (THALDUR)',
  'Thalassemia Exercise Thallium heart scan (THAL)',
  'Time when ST measure depression was noted (THALTIME)',
  'Distal left anterior descending artery (LADDIST)',
  'Proximal right coronary artery (RCAPROX)',
  'Proximal left anterior descending artery (LADPROX)',
  'Exercise-induced angina number (EXANG)',
  'Exercise maximum heart rate achieved (THALACH)',
  'Slope of the peak exercise ST segment (SLOPE)',
  'Height at peak exercise (RLDV5E)',
  'First obtuse marginal branch (OM1)',
  ];

// VARIABLE DESCRIPTION
List<String> variableDescription = [' Good <= 200, Borderline <= 239, High > 240',
  'Values = 1,2,3,4',
  'Number of cigarettes per day',
  'Number of years as a smoker',
  '1 = provoked by exertion; 0 = otherwise',
  '1 = relieved after rest; 0 = otherwise',
  '0 = normal; 1 = ST-T abnormality; 2 = probable or definite',
  'Values = 1,2,3,4....12',
  '0 to 6.2 continuous value ',
  '1 = yes; 0 = no ',
  'Values = 0 or 1 or 2 or 3',
  'Duration of exercise test in minutes',
  '3 = normal; 6 = fixed defect; 7 = reversible defect',
  'Time in Minutes',
  '1 = yes; 0 = no',
  '1 = yes; 0 = no',
  '1 = yes; 0 = no',
  '1 = yes; 0 = no',
  'Heart Rate achieved during Exercise',
  '1 = upsloping; 2 = flat; 3 = downsloping',
  'Height of ECG at peak exercise',
  '1 = yes; 0 = no',
  ];


List<String> infoPanel = ['Serum cholesterol in mg/dl, Good <= 200, Borderline <= 239, High > 240',
  'Chest pain type: 1 = typical angina; 2 = atypical angina; 3 = non-angina pain; 4 = asymptomatic',
  'Number of Cigarettes per day',
  'Number of years as a smoker',
  'Pain exerted during Exercise (1 = yes; 0 = no)',
  'Relieved after Exercise (1 = yes; 0 = no)',
  'Resting ECG results after exercise, 0 = normal; 1 = ST-T abnormality; 2 = probable or definite left ventricular hypertrophy',
  'Exercise protocol for patients : 1 = Bruce; 2 = Kottus; 3 = McHenry; 4 = Fast Balke; 5 = Balke; 6 = Noughton; 7 = bike 150 kpa min/min; 8 = bike 125 kpa min/min; 9 = bike 100 kpa min/min; 10 = bike 75 kpa min/min; 11 = bike 50 kpa min/min; 12 = arm ergometer',
  'Exercise-induced ST depression relative to rest, values are in range 0.0 to 6.2',
  'Circumflex is Bending of coronary artery (1 = yes; 0 = no)',
  'Number of major vessels (0–3) colored by fluoroscopy',
  'Duration of exercise test in minutes',
  'Blood Thalassemia levels 3 = normal; 6 = fixed defect; 7 = reversible defect',
  'Time when ST measure depression was noted',
  'Left anterior descending coronary artery (1 = yes; 0 = no)',
  'Proximal right coronary artery (1 = yes; 0 = no)',
  'Proximal left anterior descending artery (1 = yes; 0 = no)',
  'Exercise-induced angina (1 = yes; 0 = no)',
  'Exercise Max Heart Rate Achieved',
  'Slope of peak exercise ST segment: 1 = upsloping; 2 = flat; 3 = downsloping',
  'Height of ECG at peak exercise',
  'First obtuse Marginal branch (1 = yes; 0 = no)',
];

// FOR FUTURE USE
List<String> notUsed = ['CHOL, Serum cholesterol in mg/dl, Good <= 200, Borderline <= 239, High > 240',
  'CP,Chest pain type: 1 = typical angina; 2 = atypical angina; 3 = non-angina pain; 4 = asymptomatic',
  'CIGS, Number of Cigarettes per day',
  'YEARS, Number of years as a smoker',
  'PAINEXER, Pain exerted during Exercise 1 = yes; 0 = no',
  'RELREST, Relieved after Exercise 1 = yes; 0 = no',
  'RESTECG, Resting ECG results after exercise, 0 = normal; 1 = ST-T abnormality; 2 = probable or definite left ventricular hypertrophy',
  'PROTO,It is Exercise protocol for patients : 1 = Bruce; 2 = Kottus; 3 = McHenry; 4 = Fast Balke; 5 = Balke; 6 = Noughton; 7 = bike 150 kpa min/min; 8 = bike 125 kpa min/min; 9 = bike 100 kpa min/min; 10 = bike 75 kpa min/min; 11 = bike 50 kpa min/min; 12 = arm ergometer',
  'OLDPEAK, It is Exercise-induced ST depression relative to rest, values are in range 0.0 to 6.2',
  'CXMAIN, It is called Circumflex (Bending of coronary artery) 1 = yes; 0 = no ',
  'CA, it is Number of major vessels (0–3) colored by fluoroscopy',
  'THALDUR, Duration of exercise test in minutes',
  'THAL, Blood Thalassemia levels 3 = normal; 6 = fixed defect; 7 = reversible defect',
  'THALTIME, it is time when ST measure depression was noted',
  'LADDIST, Left anterior descending coronary artery 1 = yes; 0 = no',
  'RCAPROX, it is Proximal right coronary artery 1 = yes; 0 = no',
  'LADPROX, it is Proximal left anterior descending artery 1 = yes; 0 = no',
  'EXANG is Exercise-induced angina (1 = yes; 0 = no)',
  'THALACH is Exercise Max Heart Rate Achieved',
  'SLOPE, The slope of the peak exercise ST segment: 1 = upsloping; 2 = flat; 3 = downsloping',
  'RLDV5E is the Height of ECG at peak exercise',
  'OM1, it is First obtuse Marginal branch 1 = yes; 0 = no',
];



// DATA TYPE CASES FOR THE VARIABLES
List<String> variableType = ['Integer number',
  'Option list',
  'Integer number',
  'Integer number',
  'Binary option',
  'Binary option',
  'Option list',
  'Option list',
  'Real number',
  'Binary option',
  'Option list',
  'Real number',
  'Option list',
  'Real number',
  'Binary option',
  'Binary option',
  'Binary option',
  'Binary option',
  'Integer number',
  'Option list',
  'Integer number',
  'Binary option'];

// ****** [FOR FUTURE USE] ******
// VARIABLE CODES
List<String> variableCode = ['CHOL',
  'CP',
  'CIGS',
  'YEARS',
  'PAINEXER',
  'RELREST',
  'RESTECG',
  'PROTO',
  'OLDPEAK',
  'CXMAIN',
  'CA',
  'THALDUR',
  'THAL',
  'THALTIME',
  'LADDIST',
  'RCAPROX',
  'LADPROX',
  'EXANG',
  'THALACH',
  'SLOPE',
  'RLDV5E',
  'OM1',
];


