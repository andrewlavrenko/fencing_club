import 'package:fencing_club/pages/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class edit_profile extends StatefulWidget {
  @override
  _edit_profileState createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  @override
  //String Name = '';
//String Surname = '';
//
//   String Patronymic = '';
//
//   String Address = '';
//
//   String Telephone = '';
//
//   String Email = '';
//
//   String FencingJacketSize = '';
//
//   String FencingProtectionSize = '';
//
//   String FencingPantsSize = '';
//
//   String FencingMaskSize = '';


  Widget build(BuildContext context) {
    getUsers(FirebaseAuth.instance.currentUser);
    String Inicials = users[0][0] + users[1][0];

    String Name = users[0];
    String Surname = users[1];
    String Patronymic = users[2];
    String Address = users[5];
    String Telephone = users[6];
    String Email = users[7];
    String FencingJacketSize = users[8];
    String FencingProtectionSize = users[9];
    String FencingPantsSize = users[10];
    String FencingMaskSize = users[11];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Редактирование',
            style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        children: [
          Padding(padding: EdgeInsets.only(top: 10)),
          CircleAvatar(
            backgroundColor: Colors.deepPurpleAccent,
            child: Text(
              '$Inicials',
              style: TextStyle(color: Colors.white, fontSize: 65),
            ),
            radius: 60,
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text('Имя:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextFormField(
            enabled: true,
            initialValue:'${users[0]}',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
              //labelText: '${users[0]}',
              //labelStyle: TextStyle(color: Colors.black38),
            ),
            onChanged: (String value) {
              Name = value;
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Фамилия:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextFormField(
            enabled: true,
            initialValue:'${users[1]}',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              //labelText: '${users[1]}',
              //labelStyle: TextStyle(color: Colors.black38),
            ),
            onChanged: (String value) {
              Surname = value;
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Отчество:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextFormField(
            enabled: true,
            initialValue:'${users[2]}',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              //labelText: '${users[2]}',
              //labelStyle: TextStyle(color: Colors.black38),
            ),
            onChanged: (String value) {
              Patronymic = value;
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Пол:'),
          Row(
            children: [
              Radio(
                  value: 'Мужской',
                  groupValue: '${users[3]}',
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (value) {
                    setState(() {
                      users[3] = value;
                    });
                  }),
              Text('Мужской'),
              Flexible(child: SizedBox(width: 50)),
              Radio(
                  value: 'Женский',
                  groupValue: '${users[3]}',
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (value) {
                    setState(() {
                      users[3] = value;
                    });
                  }),
              Text('Женский'),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Фехтовальная рука:'),
          Row(
            children: [
              Radio(
                  value: 'Правая',
                  groupValue: '${users[4]}',
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (value) {
                    setState(() {
                      users[4] = value;
                    });
                  }),
              Text('Правая'),
              Flexible(child: SizedBox(width: 25)),
              Radio(
                  value: 'Левая',
                  groupValue: '${users[4]}',
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (value) {
                    setState(() {
                      users[4] = value;
                    });
                  }),
              Text('Левая'),
              Flexible(child: SizedBox(width: 25)),
              Radio(
                  value: 'Обе',
                  groupValue: '${users[4]}',
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (value) {
                    setState(() {
                      users[4] = value;
                    });
                  }),
              Text('Обе'),
            ],
          ),
          Text('Адрес:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextFormField(
            enabled: true,
            initialValue:'${users[5]}',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              //labelText: '${users[5]}',
              //labelStyle: TextStyle(color: Colors.black38),
            ),
            onChanged: (String value) {
              Address = value;
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Номер телефона:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextFormField(
            enabled: true,
            initialValue:'${users[6]}',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              //labelText: '${users[6]}',
              //labelStyle: TextStyle(color: Colors.black38),
            ),
            onChanged: (String value) {
              Telephone = value;
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Email:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextFormField(
            enabled: true,
            initialValue:'${users[7]}',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              //labelText: '${users[7]}',
              //labelStyle: TextStyle(color: Colors.black38),
            ),
            onChanged: (String value) {
              Email = value;
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Размер фехтовальной куртки:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextFormField(
            enabled: true,
            initialValue:'${users[8]}',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              //labelText: '${users[8]}',
              //labelStyle: TextStyle(color: Colors.black38),
            ),
            onChanged: (String value) {
              FencingJacketSize = value;
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Размер фехтовальной защиты:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextFormField(
            enabled: true,
            initialValue:'${users[9]}',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              //labelText: '${users[9]}',
              //labelStyle: TextStyle(color: Colors.black38),
            ),
            onChanged: (String value) {
              FencingProtectionSize = value;
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Размер фехтовальных штанов:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextFormField(
            enabled: true,
            initialValue:'${users[10]}',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              //labelText: '${users[10]}',
              //labelStyle: TextStyle(color: Colors.black38),
            ),
            onChanged: (String value) {
              FencingPantsSize = value;
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Размер фехтовальной маски:'),
          Padding(padding: EdgeInsets.only(top: 5)),
          TextFormField(
            enabled: true,
            initialValue:'${users[11]}',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              //labelText: '${users[11]}',
              //labelStyle: TextStyle(color: Colors.black38),
            ),
            onChanged: (String value) {
              FencingMaskSize = value;
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          if (Name == '' ||
              Surname == '' ||
              Patronymic == '' ||
              Address == '' ||
              Telephone == '' ||
              Email == '' ||
              FencingJacketSize == '' ||
              FencingProtectionSize == '' ||
              FencingPantsSize == '' ||
              FencingMaskSize == '') {
            Fluttertoast.showToast(
                msg: 'Все поля должны быть заполнены.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else {
            usersRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
              "name": "$Name",
              "surname": "$Surname",
              "patronymic": "$Patronymic",
              "gender": "${users[3]}",
              "hand": "${users[4]}",
              "address": "$Address",
              "telephone": "$Telephone",
              "email": "$Email",
              "fencingJacketSize": "$FencingJacketSize",
              "fencingProtectionSize": "$FencingProtectionSize",
              "fencingPantsSize": "$FencingPantsSize",
              "fencingMaskSize": "$FencingMaskSize",
            });
            users.clear();
            getUsers(FirebaseAuth.instance.currentUser);
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
                context, '/loading', (route) => false);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.greenAccent,
                content: Text('Изменения сохранены.'))
            );
          }
        },
        child: Icon(
          Icons.save_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
