import 'package:bmicalculatorflutter/components/reusable_buttons.dart';
import 'package:bmicalculatorflutter/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String? bmiResult;
  final String? resultText;
  final String? interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Result',
          style: klabelTextStyle.copyWith(fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Expanded(
                  child: ReusableCard(
                      width: double.infinity,
                      color: kactiveCardColor,
                      cardChild: Padding(
                        padding:  EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              resultText!,
                              style: kresultTextStyle,
                            ),
                            Text(
                              bmiResult!,
                              style: kBMITextStyle,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  color: kButtonColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                '18.5-25 = w/m2',
                                style: kBodyTextStyle.copyWith(color: Color.fromARGB(255, 232, 47, 103)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              interpretation!,
                              style: kBodyTextStyle,
                            ),
                          ],
                        ),
                      )),
                ),
              ]),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: (() => Navigator.pop(context)),
          )
        ],
      ),
    );
  }
}
