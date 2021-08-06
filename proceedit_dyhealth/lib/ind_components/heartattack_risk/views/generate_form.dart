import 'package:flutter/material.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/models/myVariables.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/models/textFormValidation.dart';

// Iterate through the variable type, check their type and call the method that validates user input.
// add those method to a list so that we can display them in our Scaffold.
List getForms() {
  List<TextFormField> forms = [];

  for (int i = 0; i < variableCode.length; i++) {
    switch (variableType[i]) {
      case 'Integer number':
        {
          forms.add(BuildFormInteger(
              title: variableLabels[i],
              description: variableDescription[i],
              type: variableType[i],
              code:variableCode[i]));
        }
        break;
      case 'Binary option':
        {
          forms.add(BuildFormBinaryOption(
              title: variableLabels[i],
              description: variableDescription[i],
              type: variableType[i],
              code:variableCode[i]));
        }
        break;
      case 'Option list':
        {
          forms.add(BuildFormOptionList(
              title: variableLabels[i],
              description: variableDescription[i],
              type: variableType[i],
              code:variableCode[i]));
        }
        break;
      case 'Real number':
        {
          forms.add(BuildFormRealNumber(
              title: variableLabels[i],
              description: variableDescription[i],
              type: variableType[i],
              code:variableCode[i]));
        }
        break;
    }
  }
  return forms;
}