import 'package:bmi_calculator/Screens/Results_page.dart';
import 'package:bmi_calculator/Components/RoundIconButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Components/Reusablecard.dart';
import 'package:bmi_calculator/Components/Iconcontent.dart';
import 'package:bmi_calculator/Components/Contants.dart';
import '../CalculatorBrain.dart';

enum Gender { male, female }

class Screen1 extends StatefulWidget {
  Screen1({Key key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  void increment_decrement(int i, int type) {
    setState(() {
      (type == 1)
          ? (i == 1)
              ? weight--
              : weight++
          : (i == 1)
              ? age--
              : age++;
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculation'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ResuableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      resuablechild: Icon_Content(
                          icon: FontAwesomeIcons.mars, text: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: ResuableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      resuablechild: Icon_Content(
                          icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ResuableCard(
                colour: kActiveCardColor,
                resuablechild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kTextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'Cm',
                          style: kTextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: kTextstyle.color,
                          thumbColor: kBottomContainerColor,
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 150,
                          max: 220,
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.toInt();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ResuableCard(
                      colour: kActiveCardColor,
                      resuablechild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: kTextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    increment_decrement(1, 1);
                                  }),
                              SizedBox(
                                width: 20,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    increment_decrement(2, 1);
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ResuableCard(
                      colour: kActiveCardColor,
                      resuablechild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kTextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    increment_decrement(1, 2);
                                  }),
                              SizedBox(
                                width: 20,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    increment_decrement(2, 2);
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain calculate = new CalculatorBrain(height, weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(calculate.bmicalculator(),
                        calculate.getResult(), calculate.getInterpretation()),
                  ),
                );
              },
              child: Container(
                color: kBottomContainerColor,
                margin: EdgeInsets.only(top: 10.0),
                height: kBottomContainerHeight,
                child: Center(
                  child: Text(
                    'Calculate',
                    style: kLargeButtonTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
