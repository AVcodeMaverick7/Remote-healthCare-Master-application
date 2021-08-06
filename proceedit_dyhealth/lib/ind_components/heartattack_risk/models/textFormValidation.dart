import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Map<String, dynamic> savedData = {};

String integer = '^[0-9]+\$';
RegExp regExp_integer = new RegExp(integer);
String optionList = '^[0-9]*[0-9][0-9]*\$';
RegExp regExp_optionList = new RegExp(optionList);
String realNumber = '[+-]?([0-9]*[.])?[0-9]+';
RegExp regExp_realNumber = new RegExp(realNumber);
String binaryOption = '[0-1]';
RegExp regExp_binaryOption = new RegExp(binaryOption);

// Build a form that accepts only integers
TextFormField BuildFormInteger(
    {String title, String description, String type,String code}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: title,
      hintText: description,
    ),
    inputFormatters: [FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s"))],
    textInputAction: TextInputAction.next,
     keyboardType: TextInputType.numberWithOptions(decimal: true),
    validator: (v) {
      // ignore: unrelated_type_equality_checks
      if (regExp_integer.hasMatch(v)) {
        // So, the email is valid
        return null;
      } else {
        return 'Please enter an integer number';
      }
    },
    onChanged: (value) {
      savedData[code] = value;
    },
  );
}

// Build a form that accepts only option lists
TextFormField BuildFormOptionList(
    {int position,String title, String description, String type,String code}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: title,
      hintText: description,
    ),
    inputFormatters: [FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s"))],
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    validator: (v) {
      // ignore: unrelated_type_equality_checks
      if (regExp_optionList.hasMatch(v)) {
        // So, the email is valid
        return null;
      } else {
        return 'Please enter a valid option';
      }
    },
    onChanged: (value) {
      savedData[code] = value;
    },
  );
}

// Build a form that accepts only binary options
TextFormField BuildFormBinaryOption(
    {int position,String title, String description, String type,String code}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: title,
      hintText: description,
    ),
    inputFormatters: [FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s"))],
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    textInputAction: TextInputAction.next,
    validator: (v) {
      // ignore: unrelated_type_equality_checks
      if (regExp_binaryOption.hasMatch(v)) {
        // So, the email is valid
        return null;
      } else {
        return 'Please enter a number  0 or 1';
      }
    },
    onChanged: (value) {
      savedData[code] = value;
    },
  );
}

// Build a form that accepts only real numbers
TextFormField BuildFormRealNumber(
    {int position,String title, String description, String type, String code}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: title,
      hintText: description,
    ),
    inputFormatters: [FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s"))],
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    textInputAction: TextInputAction.next,
    validator: (v) {
      // ignore: unrelated_type_equality_checks
      if (regExp_realNumber.hasMatch(v)) {
        // So, the email is valid
        return null;
      } else {
        return 'Please enter a real number';
      }
    },
    onChanged: (value) {
      savedData[code] = value;
    },
  );
}
