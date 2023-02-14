import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_shapes/flutter_shapes.dart';
import 'package:towerbox/controllers/home_controller.dart';
import 'package:towerbox/widgets/tower_row.dart';
import 'package:towerbox/widgets/tower_column.dart';
import 'package:towerbox/widgets/tower_row.dart';
import 'package:get/get.dart';

class TowerBoxGame extends StatefulWidget {
  @override
  _TowerBoxGameState createState() => _TowerBoxGameState();
}

class _TowerBoxGameState extends State<TowerBoxGame> {
  List<int> Box = [2, 1, 1, 2, 1, 3];
  int? _destroyedBoxes = 0;
  int? _totalTime = 0;
  int? _startTime;
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    _generateBoxes();
  }

  void _generateBoxes() {
    var random = Random();
    for (int i = 0; i < 10; i++) {
      var color = random.nextBool() ? Colors.pink : Colors.blue;
      // boxes.add(Box(i, color));
    }
  }

  // void _destroyBox(Box box) {
  //   setState(() {
  //     boxes[box.index] = box.copyWith(destroyed: true);
  //     _destroyedBoxes;
  //     // _destroyedBoxes++;
  //   });
  // }

  void _showTimeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Time'),
          content: Text('Total time: $_totalTime seconds'),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black;
    Shapes shapes = Shapes(
        canvas: canvas,
        radius: 50,
        paint: paint,
        center: Offset.zero,
        angle: 0);

    shapes.drawCircle(); // method name
    shapes.drawType(ShapeType.Circle); // enum
    shapes.draw('Circle'); // string
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            // resizeToAvoidBottomInset: false,
            body: controller.pageCheck(context) ? TowerColumn() : TowerRow(),
          );
        });
  }
}
