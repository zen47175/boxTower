import 'package:flutter/material.dart';

class circleButt extends StatelessWidget {
  final Color color;
  final VoidCallback onpressed;
  final VoidCallback ontap;
  circleButt({
    Key? key,
    required this.color,
    required this.onpressed,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: color, // Button color
        child: InkWell(
          onTap: ontap,
          onLongPress: onpressed,
          child: const SizedBox(width: 64, height: 64),
        ),
      ),
    );
  }
}
