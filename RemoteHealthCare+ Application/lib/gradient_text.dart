import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  GradientText(
      this.text, {
        @required this.gradient,
        this.onTap,
      });

  final String text;
  final Gradient gradient;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            // The color must be set to white for this to work
            color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}