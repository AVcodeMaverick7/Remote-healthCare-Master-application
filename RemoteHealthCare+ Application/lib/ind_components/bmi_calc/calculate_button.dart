import 'package:flutter/material.dart';
import 'package:proceedit_dyhealth/ind_components/bmi_calc/bconstants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton.icon(
        onPressed: onTap,
        icon: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        label: Text(
          buttonTitle,
          style: kLargeButtonTextStyle,
        ),
        textColor: Colors.white,
        color: kBottomContainerColour,
        splashColor: Colors.blue,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      width: double.infinity,
      height: kBottomContainerHeight,
      margin: EdgeInsets.only(top: 20.0, bottom: 25.0, left: 15.0, right: 15.0),
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}

