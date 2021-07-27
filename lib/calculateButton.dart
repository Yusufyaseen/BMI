import 'package:flutter/material.dart';
import 'constants.dart';

class ButtonButton extends StatelessWidget {
  ButtonButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                this.buttonTitle,
                style: largeButtonTextStyle,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 170.0,
              child: Divider(
                color: Colors.black45,
                height: 100,
                thickness: 5,
              ),
            ),
          ],
        ),
        margin: EdgeInsets.only(top: 10.0),
        height: bottomHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: bottomColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
