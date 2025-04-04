import 'package:flutter/material.dart';

import 'package:weather_app_flutter/presentation/screens/home/home_screen.dart';

class MyAppScreen extends StatelessWidget {
  MyAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
