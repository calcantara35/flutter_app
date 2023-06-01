import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:geico_mock_login/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Locking device orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? buildCupertinoApp() : buildMaterialApp();
  }

  /* 
    Builds the application using Cupertino based theme/styling/widgets.
    The context passed around will use the CupertinoApp not Material/
  */
  CupertinoApp buildCupertinoApp() {
    return const CupertinoApp(
      title: 'Geico',
      color: Color.fromARGB(255, 19, 73, 148),
      theme: CupertinoThemeData(
        barBackgroundColor: Color.fromRGBO(19, 73, 148, 1),
        primaryContrastingColor: CupertinoColors.white,
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.white,
          textStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: CupertinoColors.black),
          actionTextStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: CupertinoColors.white),
          tabLabelTextStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: CupertinoColors.white),
          navTitleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: CupertinoColors.white),
          navLargeTitleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: CupertinoColors.white),
          navActionTextStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: CupertinoColors.white),
        ),
        primaryColor: Color.fromARGB(255, 19, 73, 148),
      ),
      home: LoginScreen(),
    );
  }

  /* 
    Builds the application using Cupertino based theme/styling/widgets.
    The context passed around will use the CupertinoApp not Material/
   */
  MaterialApp buildMaterialApp() {
    return MaterialApp(
      title: 'Geico',
      theme: ThemeData(
        navigationBarTheme: const NavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 2, 87, 156)),
        iconButtonTheme: const IconButtonThemeData(
            style:
                ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white))),
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          bodyLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          bodyMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          bodySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        fontFamily: 'Quicksand',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 2, 87, 156),
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
