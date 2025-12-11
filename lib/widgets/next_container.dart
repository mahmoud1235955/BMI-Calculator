import 'package:flutter/material.dart';

class NextContainer extends StatelessWidget {
  const NextContainer({super.key, required this.text, required this.fun});
  final String text;
  final GestureTapCallback fun;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(color: Color(0xffE83D67)),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
