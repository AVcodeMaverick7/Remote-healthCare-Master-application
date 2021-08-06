import 'package:flutter/material.dart';
import 'package:proceedit_dyhealth/gradient_text.dart';
import 'package:proceedit_dyhealth/mpconstants.dart';


class Dummy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Safe House'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientText('Oops..!',gradient: kGradientText),
            GradientText('Page',gradient: kGradientText),
            GradientText('Under Construction',gradient: kGradientText),
            Container(
              height: 400.0,
              width: 400.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/safepage.png'),
                  fit: BoxFit.contain,),
                borderRadius: BorderRadius.circular(10.0),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
