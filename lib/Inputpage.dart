import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Reusablecard.dart';
import 'Iconcontent.dart';
import 'Contants.dart';

enum Gender { male, female }

class InputPagemain extends StatelessWidget {
  const InputPagemain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputPage();
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(children: [
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
                    resuablechild:
                        Icon_Content(icon: FontAwesomeIcons.mars, text: 'MALE'),
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
              ]),
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
              child: Row(children: [
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
                            FloatingActionButton(
                              onPressed: () => {
                                setState(() {
                                  weight--;
                                })
                              },
                              backgroundColor: kFloatingButtonColor,
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () => {
                                setState(() {
                                  weight++;
                                }),
                              },
                              backgroundColor: kFloatingButtonColor,
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
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
                              FloatingActionButton(
                                backgroundColor: kFloatingButtonColor,
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () => {
                                  setState(() {
                                    age--;
                                  }),
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              FloatingActionButton(
                                backgroundColor: kFloatingButtonColor,
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () => {
                                  setState(() {
                                    age++;
                                  }),
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/screen2');
              },
              child: Container(
                color: kBottomContainerColor,
                margin: EdgeInsets.only(top: 10.0),
                height: kBottomContainerHeight,
                child: Text(
                  'Calculate',
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
