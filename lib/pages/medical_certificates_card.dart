import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fencing_club/timeConvert/timeConvert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class medical_certificates_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Справка',
            style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
      ),
    );
  }
}
