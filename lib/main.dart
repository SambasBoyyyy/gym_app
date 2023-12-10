import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/pages/goal.dart';
import 'package:gym_app/pages/stats/text.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 debugShowCheckedModeBanner: false,
      home:  Goal(),
    );
  }
}


