import 'package:flutter/material.dart';

class BoxColumn extends StatelessWidget {
  final Color color;
  final Animation<double> animation;

  const BoxColumn({
    Key? key,
    required this.color,
    required this.animation,
    required Type item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            SizedBox(
              height: 64,
              width: 120,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
