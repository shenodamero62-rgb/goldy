import 'package:flutter/material.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/core/persention/home_screen.dart';
import 'package:goldy/core/routing/app_router.dart';
import 'package:goldy/core/routing/routes.dart';
import 'package:goldy/features/gold/persentation/screen/widgets/gold_screen.dart';
import 'package:goldy/features/sliver/persentation/screen/widgets/sliver_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        AppRoutes.goldscreen: (context) => GoldScreen(),
        AppRoutes.sliverscreen: (context) => SliverScreen(),
      },

      debugShowCheckedModeBanner: false,
      // initialRoute: '/homescreen',
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
