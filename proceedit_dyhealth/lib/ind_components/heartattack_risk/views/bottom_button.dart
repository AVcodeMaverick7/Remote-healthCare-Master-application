import 'package:flutter/material.dart';
import 'package:proceedit_dyhealth/ind_components/heartattack_risk/models/myVariables.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton.icon(
        onPressed: onTap,
        label: Text(
          buttonTitle,
          style: kLargeButtonTextStyle,
        ),
        icon: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        ),
      width: double.infinity,
      height: kBottomContainerHeight,
      margin: EdgeInsets.only(top: 20.0, bottom: 25.0, left: 15.0, right: 15.0),
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}

