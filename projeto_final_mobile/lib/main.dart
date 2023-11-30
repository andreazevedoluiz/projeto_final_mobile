import 'package:flutter/material.dart';
import 'package:projeto_final_mobile/components/task.dart';
import 'package:projeto_final_mobile/data/task_inherited.dart';
import 'package:projeto_final_mobile/screens/initial_screen.dart';
import 'package:projeto_final_mobile/screens/login_screen.dart';
import 'package:projeto_final_mobile/screens/registerLogin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}
