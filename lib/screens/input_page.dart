import 'package:bmicalculatorflutter/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/icon_content.dart';
import '../components/reusable_buttons.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 178;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR by ZAHREBA'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                                selectedGender = Gender.male;
                              });
                            },
                            color: selectedGender == Gender.male
                                ? kactiveCardColor
                                : kinactiveCardColor,
                            cardChild: IconContent(
                              icon: FontAwesomeIcons.mars,
                              text: 'MALE',
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                            color: selectedGender == Gender.female
                                ? kactiveCardColor
                                : kinactiveCardColor,
                            cardChild: IconContent(
                              icon: FontAwesomeIcons.venus,
                              text: 'FEMALE',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'HEIGHT',
                            style: klabelTextStyle,
                          ),
                          Row(
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: [
                                Text(
                                  height.toString(),
                                  style: kNumberTextStyle,
                                ),
                                const Text(
                                  'CM',
                                  style: klabelTextStyle,
                                )
                              ]),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15),
                            ),
                            child: Slider(
                              thumbColor: kbottomContainerColor,
                              activeColor: Colors.white,
                              min: 70,
                              max: 272,
                              value: height.toDouble(),
                              onChanged: (double _newValue) {
                                setState(() {
                                  height = _newValue.toInt();
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
                      children: [
                        Expanded(
                          child: ReusableCard(
                            color: kactiveCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'WEIGHT',
                                  style: klabelTextStyle,
                                ),
                                Text(
                                  weight.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RoundedRectangleButton(
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                      color: kButtonColor,
                                      child: const Icon(
                                        FontAwesomeIcons.minus,
                                        color: Colors.white,
                                      ),
                                    ),
                                    RoundedRectangleButton(
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      color: kButtonColor,
                                      child: const Icon(
                                        FontAwesomeIcons.plus,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            color: kactiveCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'AGE',
                                  style: klabelTextStyle,
                                ),
                                Text(
                                  age.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RoundedRectangleButton(
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                      color: kButtonColor,
                                      child: const Icon(
                                        FontAwesomeIcons.minus,
                                        color: Colors.white,
                                      ),
                                    ),
                                    RoundedRectangleButton(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      color: kButtonColor,
                                      child: const Icon(
                                        FontAwesomeIcons.plus,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
