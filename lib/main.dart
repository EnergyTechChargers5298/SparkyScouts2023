import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sparky_scouts/firebase_options.dart';
import 'package:sparky_scouts/screens/auto.dart';
import 'package:sparky_scouts/screens/menu.dart';
import 'package:sparky_scouts/screens/pit.dart';
import 'package:sparky_scouts/screens/sinc.dart';

void main() async {
  // Initalizes the firebase app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialise app based on platform- web or mobile
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const MenuPage(),
      '/pit': (context) => const PitPage(),
      '/auto': (context) => const AutoPage(),
      '/sinc': (context) => const SincPage(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sparky Scouts',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MenuPage(),
    );
  }
}
