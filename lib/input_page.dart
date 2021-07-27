import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableWidget.dart';
import 'iconContent.dart';
import 'constants.dart';
import 'resultPage.dart';
import 'calculateButton.dart';
import 'roundedButton.dart';
import 'bmiBrain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableWidget(
                    colour: selectGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardWidget: IconWidget(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    colour: selectGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardWidget: IconWidget(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                  ),
                )
              ],
            )),
            Expanded(
              child: ReusableWidget(
                colour: inactiveCardColor,
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: labelTextStyle,
                    ),
                    SizedBox(
                      height: 0.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          this.height.toString(),
                          style: inputsTextStyle,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFeb1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8d8e98),
                        overlayColor: Color(0x29eb1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: this.height.toDouble(),
                        min: 60,
                        max: 300,
                        onChanged: (double newValue) {
                          setState(() {
                            this.height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableWidget(
                    colour: inactiveCardColor,
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          this.weight.toString(),
                          style: inputsTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  this.weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  this.weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    colour: inactiveCardColor,
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          this.age.toString(),
                          style: inputsTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  this.age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  this.age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            ButtonButton(
              onTap: () {
                CalculateBmi calc =
                    CalculateBmi(height: this.height, weight: this.weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calc.calculateBmi(),
                              resultText: calc.getResult(),
                              interpretationText: calc.getInterpretation(),
                            )));
              },
              buttonTitle: 'CALCULATE',
            )
          ],
        ));
  }
}
