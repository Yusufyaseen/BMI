import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusableWidget.dart';
import 'calculateButton.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretationText});
  final String bmiResult;
  final String resultText;
  final String interpretationText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Your Bmi Result',
                textAlign: TextAlign.center,
                style: resultHeadTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableWidget(
              colour: inactiveCardColor,
              cardWidget: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this.resultText,
                      style: resultTextStyle,
                    ),
                    Text(
                      this.bmiResult,
                      style: bmiTextStyle,
                    ),
                    Text(
                      this.interpretationText,
                      textAlign: TextAlign.center,
                      style: bodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ButtonButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE CALCULATE',
          )
        ],
      ),
    );
  }
}
