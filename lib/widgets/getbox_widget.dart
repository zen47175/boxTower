import 'package:flutter/material.dart';
import 'package:towerbox/models/box_data.dart';
import 'package:towerbox/widgets/box_widget.dart';
import 'package:towerbox/widgets/diamond_box.dart';

Widget buildItem(item, int index, Animation<double> animation) => BoxColumn(
      animation: animation,
      color: Box.boxData[index].color,
      item: Box,
    );
Widget buildDiamond(item, int index, Animation<double> animation) => DiamondBox(
      animation: animation,
      color: Box.boxData[index].color,
      item: Box,
    );
