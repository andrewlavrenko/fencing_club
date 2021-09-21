import 'package:fencing_club/auxiliaryfunctions/give_and_return_data.dart';
import 'package:flutter/material.dart';

class profile_card extends StatelessWidget {
  const profile_card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List PCD = returnDataProfCard();
    String inicialsP = PCD[1][0] + PCD[2][0];
    if(PCD[13]){
      return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: Text('Тренер',
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
                  '$inicialsP',
                  style: TextStyle(color: Colors.white, fontSize: 65),
                ),
                radius: 60,
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text('Имя:'),
              Padding(padding: EdgeInsets.only(top: 5)),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  labelText: '${PCD[1]}',
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
                  labelText: '${PCD[2]}',
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
                  labelText: '${PCD[3]}',
                  labelStyle: TextStyle(color: Colors.black87),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text('Пол:'),
              Row(
                children: [
                  Radio(
                      value: 'Мужской',
                      groupValue: PCD[4],
                      activeColor: Colors.black54,
                      onChanged: (value) {}),
                  Text('Мужской'),
                  Flexible(child: SizedBox(width: 50)),
                  Radio(
                      value: 'Женский',
                      groupValue: PCD[4],
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
                      groupValue: PCD[5],
                      activeColor: Colors.black54,
                      onChanged: (value) {}),
                  Text('Правая'),
                  Flexible(child: SizedBox(width: 25)),
                  Radio(
                      value: 'Левая',
                      groupValue: PCD[5],
                      activeColor: Colors.black54,
                      onChanged: (value) {}),
                  Text('Левая'),
                  Flexible(child: SizedBox(width: 25)),
                  Radio(
                      value: 'Обе',
                      groupValue: PCD[5],
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
                  labelText: '${PCD[6]}',
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
                  labelText: '${PCD[7]}',
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
                  labelText: '${PCD[8]}',
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
                  labelText: '${PCD[9]}',
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
                  labelText: '${PCD[10]}',
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
                  labelText: '${PCD[11]}',
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
                  labelText: '${PCD[12]}',
                  labelStyle: TextStyle(color: Colors.black87),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text('uid: ${PCD[0]}',style: TextStyle(color: Colors.black54),),
              Padding(padding: EdgeInsets.only(top: 10)),
            ],
          ));
    }else{
      return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: Text('Член клуба',
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
                  '$inicialsP',
                  style: TextStyle(color: Colors.white, fontSize: 65),
                ),
                radius: 60,
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text('Имя:'),
              Padding(padding: EdgeInsets.only(top: 5)),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  labelText: '${PCD[1]}',
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
                  labelText: '${PCD[2]}',
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
                  labelText: '${PCD[3]}',
                  labelStyle: TextStyle(color: Colors.black87),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text('Пол:'),
              Row(
                children: [
                  Radio(
                      value: 'Мужской',
                      groupValue: PCD[4],
                      activeColor: Colors.black54,
                      onChanged: (value) {}),
                  Text('Мужской'),
                  Flexible(child: SizedBox(width: 50)),
                  Radio(
                      value: 'Женский',
                      groupValue: PCD[4],
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
                      groupValue: PCD[5],
                      activeColor: Colors.black54,
                      onChanged: (value) {}),
                  Text('Правая'),
                  Flexible(child: SizedBox(width: 25)),
                  Radio(
                      value: 'Левая',
                      groupValue: PCD[5],
                      activeColor: Colors.black54,
                      onChanged: (value) {}),
                  Text('Левая'),
                  Flexible(child: SizedBox(width: 25)),
                  Radio(
                      value: 'Обе',
                      groupValue: PCD[5],
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
                  labelText: '${PCD[6]}',
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
                  labelText: '${PCD[7]}',
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
                  labelText: '${PCD[8]}',
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
                  labelText: '${PCD[9]}',
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
                  labelText: '${PCD[10]}',
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
                  labelText: '${PCD[11]}',
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
                  labelText: '${PCD[12]}',
                  labelStyle: TextStyle(color: Colors.black87),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text('uid: ${PCD[0]}',style: TextStyle(color: Colors.black54),),
              Padding(padding: EdgeInsets.only(top: 10)),
            ],
          ));
    }

  }
}
