import 'package:flutter/material.dart';
import 'package:goldy/core/persention/home_screen.dart';
import 'package:goldy/core/routing/app_router.dart';
import 'package:goldy/core/routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/homescreen',
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
