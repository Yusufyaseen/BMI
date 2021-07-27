import 'package:flutter/material.dart';
import 'constants.dart';

class RoundActionButton extends StatelessWidget {
  RoundActionButton({this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPressed,
      child: Icon(
        this.icon,
        size: 23.0,
      ),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      elevation: 8.0,
      shape: CircleBorder(),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      fillColor: Color(0xFF4c4f5e),
    );
  }
}
