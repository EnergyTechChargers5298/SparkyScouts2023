import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sparky_scouts/widgets/navbar.dart';

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
        bottomNavigationBar: const Navbar(index: PageIndex.menu),
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

                  String screenTest = "Hi Bob";
                  // 'The test data prints' ${data.docs[index]['MatchNum']}.';

                  return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Text(screenTest);
                        // );
                      });
                })));
  }
}
