import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget({@required this.colour, this.cardWidget, this.onPress});
  final Color colour;
  final Widget cardWidget;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        child: this.cardWidget,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: this.colour,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
