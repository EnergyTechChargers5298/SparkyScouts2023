import 'package:flutter/material.dart';
import 'package:sparky_scouts/match.dart';
import 'package:sparky_scouts/pit.dart';
import 'package:sparky_scouts/sync.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    String loginName = 'temp';
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.home), label: 'Pit'),
            NavigationDestination(icon: Icon(Icons.airlines), label: 'Match'),
            NavigationDestination(icon: Icon(Icons.sync), label: 'Sync'),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome $loginName',
                  style: const TextStyle(fontSize: 25),
                ),
                const Spacer(flex: 1),
                Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/default_pfp.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
