import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/screen/home_screen.dart';
import 'package:flutter_netflix_clone/screen/more_screen.dart';
import 'package:flutter_netflix_clone/widget/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  // Fire
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // Firebase
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bongflix',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          // colorScheme:
          //     ColorScheme.fromSwatch().copyWith(secondary: Colors.white)
        ),
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                HomeScreen(),
                Container(
                    child: const Center(
                  child: Text('Search'),
                )),
                Container(
                    child: const Center(
                  child: Text('Save'),
                )),
                MoreScreen(),
              ],
            ),
            bottomNavigationBar: Bottom(),
          ),
        ));
  }
}
