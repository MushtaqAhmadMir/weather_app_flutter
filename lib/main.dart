import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app_flutter/common/di/injection.dart';
import 'package:weather_app_flutter/presentation/screens/my_app/my_app.dart';

void main() async {
  await initComponents();
  runApp(MyAppScreen());
}

Future<void> initComponents() async {
  await dotenv.load(); // Explicitly specify the file
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencyInjection();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
