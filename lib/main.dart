import 'package:e_laundry/Screens/LoginSignupScreen.dart';
import 'package:e_laundry/Screens/MainMapScreen.dart';
import 'package:e_laundry/Screens/ShopDetails.dart';
import 'package:e_laundry/Screens/ShopOrderScreen.dart';
import 'package:e_laundry/Services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    final FirebaseApp app = await Firebase.initializeApp();
  } on FirebaseException catch (e) {
    print(e.message);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'E-Laundry App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColor: Colors.lightBlue[300],
        accentColor: const Color(0xFF00bcd4),
        canvasColor: const Color(0xFFfafafa),
        fontFamily: 'Merriweather',
      ),
      home: new AuthService(FirebaseAuth.instance).handleAuth(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(child: MainMap()),
    );
  }
}
