import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fencing_club/auxiliaryfunctions/give_and_return_data.dart';
import 'package:fencing_club/timeConvert/timeConvert.dart';
import 'package:flutter/material.dart';

class competitionCardTrainer extends StatelessWidget {
  const competitionCardTrainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List CD = returnDataCompetition();
    if (CD[3] == '') {
      return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: Text('Соревнование',
                style: TextStyle(color: Colors.white, fontSize: 24)),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Дата проведения соревнования:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(formateDate(CD[4]),
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Время начала соревнования:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(formateTime(CD[4]),
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Место проведения:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(CD[2],
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(500, 50),
                          alignment: Alignment.center,
                          primary: Colors.blueGrey, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushNamedAndRemoveUntil(context,
                              '/editCompetition', (route) => true);
                        },
                        child: Text('Редактировать')),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(500, 50),
                          alignment: Alignment.center,
                          primary: Colors.red, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('Events')
                              .doc(CD[0])
                              .delete();
                          Navigator.of(context).pop();
                        },
                        child: Text('Удалить событие')),
                  ],
                ),
              )
            ],
          ));
    } else {
      return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: Text('Соревнование',
                style: TextStyle(color: Colors.white, fontSize: 24)),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Дата проведения соревнования:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(formateDate(CD[4]),
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Время начала соревнования:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(formateTime(CD[4]),
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Место проведения:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(CD[2],
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Комментарий к соревнованию:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(CD[3],
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(500, 50),
                          alignment: Alignment.center,
                          primary: Colors.blueGrey, // background
                          onPrimary: Colors.white, // foreground
                        ),

                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushNamedAndRemoveUntil(context,
                              '/editCompetition', (route) => true);
                        },
                        child: Text('Редактировать')),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(500, 50),
                          alignment: Alignment.center,
                          primary: Colors.red, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('Events')
                              .doc(CD[1])
                              .delete();
                          Navigator.of(context).pop();
                        },
                        child: Text('Удалить событие')),
                  ],
                ),
              )
            ],
          ));
    }
  }
}
