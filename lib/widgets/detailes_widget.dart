import 'package:flutter/material.dart';

class DetailesWidget extends StatelessWidget {
  const DetailesWidget({
    super.key,
    required this.text,
    required this.number,

    required this.fun1,
    required this.fun2,
  });

  final String text;
  final String number;
  final GestureTapCallback? fun1;
  final GestureTapCallback? fun2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 180,
      decoration: BoxDecoration(
        color: Color(0xff24263B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Spacer(flex: 1),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Color(0xff8B8C9E),
            ),
          ),
          Spacer(flex: 1),
          Text(
            number,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: fun2,
                child: Image.asset("lib/assets/img/Group 1.png"),
              ),
              InkWell(
                onTap: fun1,
                child: Image.asset("lib/assets/img/Group 2.png"),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
