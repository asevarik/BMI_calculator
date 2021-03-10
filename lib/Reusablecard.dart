import 'package:flutter/material.dart';

const container1_margin = 15.0;
const conatiner1_borderradius = 15.0;

class ResuableCard extends StatelessWidget {
  final Color colour;
  final Widget resuablechild;
  final Function onPress;
  ResuableCard({@required this.colour, this.resuablechild,this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(container1_margin),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(conatiner1_borderradius),
        ),
        child: resuablechild,
      ),
    );
  }
}
