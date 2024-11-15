import 'package:flutter/material.dart';
import 'package:motionray_machine_task/view/screens/home_screen/home_screen.dart';
import 'package:motionray_machine_task/view_model/fetch_provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => FetchClientDataProvider(),
    ),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
