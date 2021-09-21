import 'package:fencing_club/pages/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class authentication extends StatelessWidget {
  @override
  String login = '';
  String password = '';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Аутентификация',
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
            Text('Для продолжения работы - авторизуйтесь.',
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
                labelText: 'Логин',
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
                        msg: 'Поля "Логин" и "Пароль" должны быть заполнены.',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: login, password: password);
                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    getUsers(user);
                    Navigator.of(context).pop();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/loading2', (route) => false);
                  } else {
                    Fluttertoast.showToast(
                        msg:
                            'Ошибка входа. Проверьте корректность введенных данных и подключение к сети.',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Text(
                  'Войти',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
            Flexible(
              child: SizedBox(height: 25),
              flex: 1,
            ),
            Flexible(
              child: Text('У вас нет учетной записи?',
                  style: TextStyle(
                    color: Colors.black54,
                  )),
              flex: 4,
            ),
            Flexible(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0.0),
                  primary: Colors.deepPurpleAccent,
                  textStyle: const TextStyle(),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/reg', (route) => true);
                },
                child: const Text('Зарегистрируйтесь.'),
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
