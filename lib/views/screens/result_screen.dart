import 'package:bmi/views/screens/calc_screen.dart';
import 'package:bmi/widgets/app_bar.dart';
import 'package:bmi/widgets/next_container.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.bmi});
  final double bmi;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2135),
      appBar: Appbar(),
      body: Column(
        children: [
          SizedBox(height: 15),
          Align(
            alignment: Alignment(-0.5, 10),
            child: Text(
              "Your Result",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: 319,
            height: 503,
            decoration: BoxDecoration(
              color: Color(0xff333244),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Spacer(flex: 1),
                Text(
                  widget.bmi <= 18.5
                      ? "Underweight"
                      : widget.bmi > 18.5 && widget.bmi < 24.9
                      ? "Normal"
                      : widget.bmi >= 24.9 && widget.bmi < 30
                      ? "Overweight"
                      : "Obesity",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: widget.bmi <= 18.5
                        ? Colors.amber
                        : widget.bmi > 18.5 && widget.bmi < 24.9
                        ? Color(0xff21BF73)
                        : widget.bmi >= 24.9 && widget.bmi < 30
                        ? Colors.orangeAccent
                        : Colors.red,
                  ),
                ),
                Spacer(flex: 1),
                Text(
                  widget.bmi.toStringAsFixed(1).toString(),
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Spacer(flex: 1),
                Text(
                  widget.bmi <= 18.5
                      ? "You are underweight. You should consider gaining some healthy weight."
                      : widget.bmi > 18.5 && widget.bmi < 24.9
                      ? "You Have a Normal Body Weight,Good Job."
                      : widget.bmi >= 24.9 && widget.bmi < 30
                      ? "You are slightly overweight. Try to adopt a healthier routine."
                      : "Your weight is in the obesity range. It's a good idea to focus on improving your lifestyle.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8B8C9E),
                  ),
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: NextContainer(
              text: "Re - Calculate",
              fun: () {
                setState(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CalcScreen();
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
