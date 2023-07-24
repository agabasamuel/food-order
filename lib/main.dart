// ignore_for_file: unused_import

// import 'package:car_spare/screens/home/home_screen.dart';

import 'package:car_spare/screens/home/home_screen.dart';
import 'package:car_spare/widgets/custom_appbar.dart';
import 'package:car_spare/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

import 'config/app_router.dart';
import 'config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'carSpare',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
      // home: const HomeScreen(),
    );
  }
}
