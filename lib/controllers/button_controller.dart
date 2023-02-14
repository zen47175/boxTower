// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:towerbox/models/box_data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:towerbox/widgets/getbox_widget.dart';
import 'package:towerbox/widgets/try_catch.dart';

class ButtonController extends GetxController {
  final key = GlobalKey<AnimatedListState>();
  final key2 = GlobalKey<AnimatedListState>();

  RxList<Box> item = <Box>[].obs;
  List items = List.from(Box.boxData).obs;
  int button1Clicked = 0;
  int button2Clicked = 0;

  @override
  void onInit() {
    ever(
      item,
      (_) {
        endTimer();
        update();
      },
    );
    tryCatchLoop(
        code: startTimer,
        onError: (error) => (debugPrint("eror $error")),
        duration: const Duration(seconds: 2),
        limitTimes: 5);
    super.onInit();
    timer =
        Timer.periodic(const Duration(seconds: 2), (Timer t) => startTimer());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  late Timer timer;
  int seconds = 0;
  void pinkButton(context) {
    int i = 0;
    if (items.isEmpty && Box.diamond[i].number == 3) {
      button2Clicked = 1;

      if (button1Clicked == 1 && button2Clicked == 1) {
        var diamond = Box.diamond.removeAt(i);

        key2.currentState?.removeItem(
            i, (context, animation) => buildDiamond(diamond, i, animation),
            duration: const Duration(milliseconds: 500));
        normalDialogEndTime(context, 'ใช้เวลาทั้งหมด', '$seconds วินาที ');
      }
    }
    for (i; i < items.length; i++) {
      var checkBox = Box.boxData[i].number;
      if (checkBox == 1) {
        timeProcess();
        final item = items.removeAt(i);
        Box.boxData.removeAt(i);

        key.currentState?.removeItem(
            i, (context, animation) => buildItem(item, i, animation),
            duration: const Duration(milliseconds: 500));
      }
      update();
      break;
    }
    update();
  }

  void blueButton(context) {
    int i = 0;
    if (items.isEmpty && Box.diamond[i].number == 3) {
      button1Clicked = 1;
      if (button1Clicked == 1 && button2Clicked == 1) {
        var deletediamond = Box.diamond.removeAt(i);
        key2.currentState?.removeItem(i,
            (context, animation) => buildDiamond(deletediamond, i, animation),
            duration: const Duration(milliseconds: 500));
        normalDialogEndTime(context, 'ใช้เวลาทั้งหมด', '$seconds วินาที ');
      }
    }
    for (i; i < items.length; i++) {
      var checkBox = Box.boxData[i].number;

      if (checkBox == 2) {
        timeProcess();
        final item = items.removeAt(i);
        Box.boxData.removeAt(i);

        key.currentState?.removeItem(
            i, (context, animation) => buildItem(item, i, animation),
            duration: const Duration(milliseconds: 500));
      }
      update();
      break;
    }
    update();
  }

  void normalDialogTap(context, String title, String desc) {
    Alert(
      context: context,
      title: title,
      desc: desc,
    ).show();
  }

  void normalDialogEndTime(context, String title, String desc) {
    if (items.isEmpty && Box.diamond.isEmpty) {
      timer.cancel();
      endTimer();
      Alert(
        context: context,
        title: title,
        desc: desc,
      ).show();
    }
  }

  void startTimer() async {
    if (items.length <= 8) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        seconds++;

        update();
      });
    } else {
      return;
    }
  }

  endTimer() async {
    if (items.isEmpty && Box.diamond.isEmpty) {
      timer.cancel();
      normalDialogTap("ใช้เวลาทั้งหมด", "$seconds วินาที", "จบ");
    }
  }

  Future<SnackbarController> timeProcess() async {
    seconds = 2;
    final snackBar = Get.snackbar(
      "กล่องจะถูกทำลายภายใน",
      "$seconds วินาที",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.green,
      margin: const EdgeInsets.all(16),
      isDismissible: true,
      colorText: Colors.white,
      maxWidth: 200,
    );
    update();
    return snackBar;
  }

  Future<SnackbarController> timeEnd() async {
    seconds = 2;
    final snackBar = Get.snackbar(
      ".",
      "$seconds วินาที",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.green,
      margin: const EdgeInsets.all(16),
      isDismissible: true,
      colorText: Colors.white,
      maxWidth: 200,
    );
    update();
    return snackBar;
  }

  Future<dynamic> stoptime() async {
    while (items.isEmpty && Box.diamond.isEmpty) {
      try {
        dialogEnd();
        timer.cancel();
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }
  }

  Future<AlertDialog> dialogEnd() async {
    final alertDialog = AlertDialog(
      title: const Text("กล่องจะถูกทำลายภายใน"),
      content: Text("$seconds วินาที"),
      actions: const [
        Text("ตกลง"),
      ],
    );
    update();
    return alertDialog;
  }

  bool checkEmpty() {
    items.isEmpty;
    return true;
  }

  bool checkdiamondEmpty() {
    Box.diamond.isEmpty;
    return true;
  }
}
