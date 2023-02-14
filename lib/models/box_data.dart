import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:towerbox/widgets/diamond_box.dart';

class Box extends GetxController {
  final Color color;
  final int number;

  Box({required this.color, required this.number});
  @override
  String toString() {
    return 'Box(color: $color, number: $number)';
  }

  static RxList<Box> boxData = [
    Box(color: Colors.pink, number: 1), //1
    Box(color: Colors.pink, number: 1), //2
    Box(color: Colors.blue, number: 2), //3
    Box(color: Colors.blue, number: 2), //4
    Box(color: Colors.pink, number: 1), //5
    Box(color: Colors.pink, number: 1), //1
    Box(color: Colors.blue, number: 2), //2
    Box(color: Colors.blue, number: 2), //3
    Box(color: Colors.pink, number: 1), //4
  ].obs;
  static List<Box> diamond = [Box(color: Colors.pink, number: 3)].obs;
}
