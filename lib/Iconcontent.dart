import 'package:flutter/material.dart';
import 'Contants.dart';
const iconsize = 80.0;

class Icon_Content extends StatelessWidget {
  final String text;
  final IconData icon;
  Icon_Content({this.text, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconsize,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kTextstyle,
        )
      ],
    );
  }
}
