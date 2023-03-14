import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sparky_scouts/firebase_options.dart';
import 'package:sparky_scouts/screens/home.dart';
import 'package:sparky_scouts/screens/match.dart';
import 'package:sparky_scouts/screens/pit.dart';
import 'package:sparky_scouts/screens/sync.dart';

void main() async {
  // Initalizes the firebase app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialise app based on platform- web or mobile
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sparky Scouts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    PitPage(),
    MatchPage(),
    SyncPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scouter App'),
        automaticallyImplyLeading: false,
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.handyman_sharp),
            label: 'Pit',
          ),
          NavigationDestination(
            icon: Icon(Icons.games_rounded),
            label: 'Match',
          ),
          NavigationDestination(
            icon: Icon(Icons.recycling),
            label: 'Sync',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
