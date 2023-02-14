import 'package:flutter/material.dart';
import "dart:math" show pi;
import 'package:flutter_svg/flutter_svg.dart';

class DiamondBox extends StatelessWidget {
  final Animation<double> animation;
  final Color color;
  const DiamondBox({
    Key? key,
    required this.animation,
    required this.color,
    required Type item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Column(
        children: [
          SizedBox(
              height: 170,
              width: 170,
              child: Transform.rotate(
                angle: pi / 4,
                child: Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.rectangle, color: color),
                ),
              )),
        ],
      ),
    );
  }
}
