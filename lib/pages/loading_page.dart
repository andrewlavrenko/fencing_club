import 'dart:async';
import 'package:fencing_club/pages/landing.dart';
import 'package:fencing_club/pages/landing2.dart';
import 'package:fencing_club/pages/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

User? user = FirebaseAuth.instance.currentUser;

class loadingPage extends StatefulWidget {
  const loadingPage({Key? key}) : super(key: key);

  @override
  _loadingPageState createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  void initState() {
    getUsers(user);
    Timer(
        Duration(seconds: 4),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => landing2())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/fencingDeepPurp250.png'),
            Padding(padding: EdgeInsets.only(bottom: 25)),
            SpinKitPouringHourGlass(color: Colors.white)
          ],
        ),
      ),
    );
  }
}
