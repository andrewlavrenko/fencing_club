import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fencing_club/pages/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final usersRef = FirebaseFirestore.instance.collection('Users');

createUser(user, login) {
  usersRef.doc(user!.uid).set({
    "name": "---",
    "surname": "---",
    "patronymic": "---",
    "gender": "---",
    "hand": "---",
    "address": "---",
    "telephone": "---",
    "email": "$login",
    "fencingJacketSize": "---",
    "fencingProtectionSize": "---",
    "fencingPantsSize": "---",
    "fencingMaskSize": "---",
    "isTrainer": false,
  });
}

class registration extends StatelessWidget {
  String login = '';
  String password = '';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация',
            style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('FENCING CLUB',
                style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 40,
                    fontWeight: FontWeight.w700)),
            Text('Для продолжения работы - зарегистрируйтесь.',
                style: TextStyle(color: Colors.black54)),
            Flexible(
              child: SizedBox(height: 40),
              flex: 1,
            ),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
                labelText: 'Электронная почта',
              ),
              onChanged: (String value) {
                login = value;
              },
            ),
            Flexible(
              child: SizedBox(height: 5),
              flex: 1,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key_outlined),
                border: OutlineInputBorder(),
                labelText: 'Пароль',
              ),
              onChanged: (String value) {
                password = value;
              },
            ),
            Flexible(
              child: SizedBox(height: 10),
              flex: 1,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepPurpleAccent)),
                onPressed: () async {
                  if (login == '' || password == '') {
                    Fluttertoast.showToast(
                        msg:
                            'Поля "Электронная почта" и "Пароль" должны быть заполнены.',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  try {
                    UserCredential result = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: login, password: password);
                    User? user = result.user;
                    createUser(user, login);
                    getUsers(user);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/loading2', (route) => false);
                  } catch (e) {
                    print(e);
                    if (e.toString() ==
                        '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.') {
                      Fluttertoast.showToast(
                          msg:
                              'Нет соединения с интернетом. Проверьте соединение и повторите попытку позже.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    if (e.toString() ==
                        '[firebase_auth/invalid-email] The email address is badly formatted.') {
                      Fluttertoast.showToast(
                          msg: 'Неправильный формат электронной почты.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    if (e.toString() ==
                        '[firebase_auth/weak-password] Password should be at least 6 characters') {
                      Fluttertoast.showToast(
                          msg:
                              'Пароль должен состоять как минимум из шести символов.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }
                },
                child: Text(
                  'Регистрация',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
            Flexible(
              child: SizedBox(height: 5),
              flex: 1,
            ),
            Flexible(
              child:
                  Text('*Пароль должен состоять как минимум из 6-ти символов.',
                      style: TextStyle(
                        color: Colors.black54,
                      )),
              flex: 6,
            ),
            Flexible(
              child: Text('**Формат электронной почты: xxxxx@xxx.ru/com.',
                  style: TextStyle(
                    color: Colors.black54,
                  )),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
