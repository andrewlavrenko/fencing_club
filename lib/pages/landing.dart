import 'package:fencing_club/pages/authentication.dart';
import 'package:fencing_club/pages/loading_page.dart';
import 'package:fencing_club/pages/profile.dart';
import 'package:fencing_club/pages/profile_trainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User? user = FirebaseAuth.instance.currentUser;

class landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = user != null;
    if (isLoggedIn) {
      return loadingPage();
    } else {
      return authentication();
    }
  }
}
