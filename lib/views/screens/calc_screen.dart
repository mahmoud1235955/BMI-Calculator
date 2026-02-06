import 'dart:math';

import 'package:bmi/views/screens/result_screen.dart';
import 'package:bmi/widgets/app_bar.dart';
import 'package:bmi/widgets/detailes_widget.dart';
import 'package:bmi/widgets/gender_container.dart';
import 'package:bmi/widgets/next_container.dart';
import 'package:flutter/material.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  double currentHight = 0.0;
  int weight = 0;
  int age = 0;
  double bmi = 0.0;
  bool colorToggle1 = true;
  bool colorToggle2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2135),
      appBar: Appbar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Spacer(flex: 1),
              GenderContainer(
                func: () {
                  setState(() {
                    colorToggle1 = false;
                    colorToggle2 = true;
                  });
                },
                color: colorToggle1 ? Color(0xff24263B) : Color(0xff3f415d),
                icon: Icons.male,
                text: "Male",
              ),
              Spacer(flex: 2),
              GenderContainer(
                func: () {
                  setState(() {
                    colorToggle1 = true;
                    colorToggle2 = false;
                  });
                },
                color: colorToggle2 ? Color(0xff24263B) : Color(0xff33344f),
                icon: Icons.female,
                text: "Female",
              ),
              Spacer(flex: 1),
            ],
          ),
          SizedBox(height: 25),
          Container(
            width: 319,
            height: 189,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff333244),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(flex: 2),
                Text(
                  "Hight",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff8B8C9E),
                  ),
                ),
                Spacer(flex: 1),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: currentHight.toInt().toString(),
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: " cm",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8B8C9E),
                        ),
                      ),
                    ],
                  ),
                ),

                Spacer(flex: 2),
                Slider(
                  min: 0,
                  max: 200,
                  value: currentHight,
                  onChanged: (value) {
                    setState(() {
                      currentHight = value;
                    });
                  },
                ),
                Spacer(flex: 4),
              ],
            ),
          ),
          SizedBox(height: 29),
          Row(
            children: [
              Spacer(flex: 1),
              DetailesWidget(
                number: weight.toString(),
                fun1: () {
                  weight++;
                  setState(() {});
                },
                fun2: () {
                  if (weight > 0) {
                    weight--;
                    setState(() {});
                  }
                },

                text: "Weight",
              ),
              Spacer(flex: 2),
              DetailesWidget(
                number: age.toString(),
                fun1: () {
                  age++;
                  setState(() {});
                },
                fun2: () {
                  if (age > 0) {
                    age--;
                    setState(() {});
                  }
                },
                text: "Age",
              ),
              Spacer(flex: 1),
            ],
          ),
          SizedBox(height: 15),
          Expanded(
            child: NextContainer(
              text: "Calculate",
              fun: () {
                setState(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultScreen(
                          bmi: weight / pow((currentHight / 100), 2).toDouble(),
                        );
                      },
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
