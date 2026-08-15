import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/main_navigation/bindings/navigation_binding.dart';
import 'features/main_navigation/screens/main_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Navigation Bottom',
      debugShowCheckedModeBanner: false,

      initialBinding: NavigationBinding(),

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),

      home: const MainNavigationScreen(),
    );
  }
}