import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  const GenderContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.func,
    required this.color,
  });
  final IconData icon;
  final String text;
  final GestureTapCallback? func;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        width: 155,
        height: 180,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, size: 96, color: Colors.white),
            Text(
              text,
              style: TextStyle(color: Color(0xff8B8C9E), fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
