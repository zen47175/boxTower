import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:towerbox/screens/tower_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tower Box ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TowerBoxGame(),
    );
  }
}
