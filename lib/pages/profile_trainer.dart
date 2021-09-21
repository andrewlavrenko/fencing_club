import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fencing_club/pages/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

User? user = FirebaseAuth.instance.currentUser;
final usersRef = FirebaseFirestore.instance.collection('Users');

class profile_trainer extends StatelessWidget {
  void initState() {
    getUsers(user);
  }

  @override
  Widget build(BuildContext context) {
    String inicials = users[0][0] + users[1][0];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Профиль',
            style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                users.clear();
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/auth', (route) => false);
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
              child: Text('Меню',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle_outlined,
                color: Colors.deepPurpleAccent,
              ),
              title: const Text('Профиль'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_today_outlined,
                color: Colors.deepPurpleAccent,
              ),
              title: const Text('Расписание'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/schedT', (route) => false);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.supervised_user_circle_outlined,
                color: Colors.deepPurpleAccent,
              ),
              title: const Text('Пользователи'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/usersT', (route) => false);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        children: [
          Padding(padding: EdgeInsets.only(top: 10)),
          CircleAvatar(
            backgroundColor: Colors.deepPurpleAccent,
            child: Text(
              '$inicials',
              style: TextStyle(color: Colors.white, fontSize: 65),
            ),
            radius: 60,
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text('Имя:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextField(
            enabled: false,
            //focusNode: ,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
              labelText: '${users[0]}',
              labelStyle: TextStyle(color: Colors.black87),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Фамилия:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              labelText: '${users[1]}',
              labelStyle: TextStyle(color: Colors.black87),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Отчество:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              labelText: '${users[2]}',
              labelStyle: TextStyle(color: Colors.black87),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Пол:'),
          Row(
            children: [
              Radio(
                  value: 'Мужской',
                  groupValue: users[3],
                  activeColor: Colors.black54,
                  onChanged: (value) {}),
              Text('Мужской'),
              Flexible(child: SizedBox(width: 50)),
              Radio(
                  value: 'Женский',
                  groupValue: users[3],
                  activeColor: Colors.black54,
                  onChanged: (value) {}),
              Text('Женский'),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Фехтовальная рука:'),
          Row(
            children: [
              Radio(
                  value: 'Правая',
                  groupValue: users[4],
                  activeColor: Colors.black54,
                  onChanged: (value) {}),
              Text('Правая'),
              Flexible(child: SizedBox(width: 25)),
              Radio(
                  value: 'Левая',
                  groupValue: users[4],
                  activeColor: Colors.black54,
                  onChanged: (value) {}),
              Text('Левая'),
              Flexible(child: SizedBox(width: 25)),
              Radio(
                  value: 'Обе',
                  groupValue: users[4],
                  activeColor: Colors.black54,
                  onChanged: (value) {}),
              Text('Обе'),
            ],
          ),
          Text('Адрес:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              labelText: '${users[5]}',
              labelStyle: TextStyle(color: Colors.black87),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Номер телефона:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              labelText: '${users[6]}',
              labelStyle: TextStyle(color: Colors.black87),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Email:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              labelText: '${users[7]}',
              labelStyle: TextStyle(color: Colors.black87),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Размер фехтовальной куртки:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              labelText: '${users[8]}',
              labelStyle: TextStyle(color: Colors.black87),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Размер фехтовальной защиты:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              labelText: '${users[9]}',
              labelStyle: TextStyle(color: Colors.black87),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Размер фехтовальных штанов:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              labelText: '${users[10]}',
              labelStyle: TextStyle(color: Colors.black87),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Размер фехтовальной маски:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              labelText: '${users[11]}',
              labelStyle: TextStyle(color: Colors.black87),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('uid: ${user!.uid}',style: TextStyle(color: Colors.black54),),
          Padding(padding: EdgeInsets.only(top: 10)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/ed_prof', (route) => true);
        },
        child: Icon(
          Icons.edit_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
