import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final Stream<QuerySnapshot> matches =
      FirebaseFirestore.instance.collection('match').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu Screen'),
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            if (index == 1) {
              Navigator.pushNamed(context, '/pit');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/match');
            } else if (index == 3) {
              Navigator.pushNamed(context, '/sync');
            }
          },
          selectedIndex: 0,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.handyman),
              label: 'Pit',
            ),
            NavigationDestination(
              icon: Icon(Icons.gamepad),
              label: 'Match',
            ),
            NavigationDestination(
              icon: Icon(Icons.sync),
              label: 'Sync',
            ),
          ],
        ),
        body: Center(
            child: StreamBuilder(
                stream: matches,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                        'Something went wrong. The error is: ${snapshot.error.toString()}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading');
                  }

                  final data = snapshot.requireData;

                  return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Text(
                            'The test data prints ${data.docs[index]['test']}.');
                      });
                })));
  }
}
