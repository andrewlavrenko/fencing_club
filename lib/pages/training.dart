import 'package:fencing_club/auxiliaryfunctions/give_and_return_data.dart';
import 'package:fencing_club/timeConvert/timeConvert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class trainingCard extends StatelessWidget {
  const trainingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List TD = returnDataTraining();
    if (TD[6] == '') {
      return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: Text('Тренировка',
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
                    Text('Дата проведения тренировки:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(formateDate(TD[4]),
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Время начала тренировки:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(formateTime(TD[4]),
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Время окончания тренировки:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(formateTime(TD[5]),
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Тренер:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(TD[2],
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Место проведения:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(TD[3],
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                  ],
                ),
              )
            ],
          ));
    } else {
      return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: Text('Тренировка',
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
                    Text('Дата проведения тренировки:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(formateDate(TD[4]),
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Время начала тренировки:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(formateTime(TD[4]),
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Время окончания тренировки:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(formateTime(TD[5]),
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Тренер:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(TD[2],
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Место проведения:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(TD[3],
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text('Комментарий к тренировке:',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Text(TD[6],
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                  ],
                ),
              )
            ],
          ));
    }
  }
}
