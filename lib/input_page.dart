import 'dart:math';

import 'package:bmi_calculator/card.dart';
import 'package:bmi_calculator/constants.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

double bmi = 1.0;
String calculateBmi(
  int weight,
  int height,
) {
  bmi = (weight) / pow(height, 2);
  bmi = bmi * 10000;
  return bmi.toString();
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String value = "";
  int height = 120;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomWidget(
                    childd: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 80,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "MALE",
                        style: kLabelTextStyle,
                      )
                    ]),
                    onPress: () {
                      setState(() {
                        value = "MALE";
                      });
                    },
                    colour: value == "MALE" ? kActiveCardColor : kInActiveCardColor,
                  ),
                ),
                Expanded(
                  child: CustomWidget(
                      childd: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "FEMALE",
                          style: kLabelTextStyle,
                        )
                      ]),
                      onPress: () {
                        setState(() {
                          value = "FEMALE";
                        });
                      },
                      colour: value == "FEMALE" ? kActiveCardColor : kInActiveCardColor),
                )
              ],
            ),
          ),
          Expanded(
              child: CustomWidget(
                  childd: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "cm",
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: kBottomContainerColor,
                          activeTickMarkColor: Colors.white,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                          trackHeight: 1),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 220,
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                  ]),
                  onPress: () {},
                  colour: kActiveCardColor)),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomWidget(
                    childd: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIcons(
                              icon: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                          RoundedIcons(
                              icon: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              })
                        ],
                      )
                    ]),
                    onPress: () {},
                    colour: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: CustomWidget(
                    childd: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIcons(
                              icon: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              }),
                          RoundedIcons(
                              icon: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              })
                        ],
                      )
                    ]),
                    onPress: () {},
                    colour: kActiveCardColor,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              calculateBmi(weight, height);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultPage(),
                  ));
              print(bmi);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kBottomContainerColor,
              ),
              width: double.infinity,
              height: kBottonContainerHeight,
              child: const Center(
                child: Text(
                  "Calculate",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedIcons extends StatelessWidget {
  final Icon icon;
  final Function onTap;
  const RoundedIcons({Key? key, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onTap();
      },
      shape: const CircleBorder(),
      fillColor: kButtonColor,
      constraints: const BoxConstraints.tightFor(width: 40, height: 40),
      elevation: 7,
      child: icon,
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("BMI CALCULATOR"),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Your Results",
              style: NumberTextStyle,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: CustomWidget(
                colour: kActiveCardColor,
                childd: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmi.toStringAsFixed(1),
                      textAlign: TextAlign.center,
                      style: kNumberTextStyle,
                    ),
                    if (bmi < 18.5)
                      const Text(
                        "Underweight",
                        style: NumberTextStyle,
                      ),
                    if (bmi >= 18.5 && bmi <= 24.9)
                      const Text(
                        "Normal Weight",
                        style: NumberTextStyle,
                      ),
                    if (bmi >= 25 && bmi <= 29.9)
                      const Text(
                        "Overweight",
                        style: NumberTextStyle,
                      ),
                    if (bmi >= 30)
                      const Text(
                        "Obesity",
                        style: NumberTextStyle,
                      ),
                  ],
                ),
                onPress: () {}),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kBottomContainerColor,
              ),
              width: double.infinity,
              height: kBottonContainerHeight,
              child: const Center(
                child: Text(
                  "Recalculate",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
