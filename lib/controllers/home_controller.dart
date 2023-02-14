import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool pageCheck(context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
}
