import 'package:fencing_club/pages/profile.dart';
import 'package:fencing_club/pages/profile_trainer.dart';
import 'package:flutter/material.dart';

class landing2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (users[12]) {
      return profile_trainer();
    } else {
      return profile();
    }
  }
}
