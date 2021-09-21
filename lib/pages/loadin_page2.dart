import 'dart:async';
import 'package:fencing_club/pages/landing2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingPage2 extends StatefulWidget {
  const loadingPage2({Key? key}) : super(key: key);

  @override
  _loadingPage2State createState() => _loadingPage2State();
}

class _loadingPage2State extends State<loadingPage2> {
  void initState() {
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
