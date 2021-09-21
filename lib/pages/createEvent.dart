import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fencing_club/timeConvert/timeConvert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class createEvent extends StatefulWidget {
  const createEvent({Key? key}) : super(key: key);

  @override
  _createEventState createState() => _createEventState();
}

class _createEventState extends State<createEvent> {
  DateTime? date = null;
  DateTime? DateAndTimeStart = null;
  DateTime? DateAndTimeEnd = null;
  TimeOfDay? time = null;
  TimeOfDay? timeEnd = null;
  String EventType = '';
  String place = '';
  String Trainer = '';
  String comment = '';

  String getText() {
    if (date == null) {
      return 'Выберете дату';
    } else {
      return '${formateDate1(date)}';
    }
  }

  String getTextTime() {
    if (time == null) {
      return 'Начало';
    } else {
      final hours = time!.hour.toString().padLeft(2, '0');
      final minutes = time!.minute.toString().padLeft(2, '0');
      return '$hours:$minutes';
    }
  }

  String getTextTimeEnd() {
    if (timeEnd == null) {
      return 'Конец';
    } else {
      final hoursEnd = timeEnd!.hour.toString().padLeft(2, '0');
      final minutesEnd = timeEnd!.minute.toString().padLeft(2, '0');

      return '$hoursEnd:$minutesEnd';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Создание события',
            style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Тип события:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 'Тренировка',
                          groupValue: '$EventType',
                          activeColor: Colors.deepPurpleAccent,
                          onChanged: (value) {
                            setState(() {
                              EventType = value.toString();
                            });
                          }),
                      Text('Тренировка'),
                    ],
                  ),
                  Flexible(child: SizedBox(width: 50)),
                  Row(
                    children: [
                      Radio(
                          value: 'Соревнование',
                          groupValue: '$EventType',
                          activeColor: Colors.deepPurpleAccent,
                          onChanged: (value) {
                            setState(() {
                              EventType = value.toString();
                            });
                          }),
                      Text('Соревнование'),
                    ],
                  ),
                ],
              ),
              Text('Место проведения:'),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              TextField(
                enabled: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                  ),
                ),
                onChanged: (String value) {
                  place = value;
                },
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text('Тренер:'),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              TextField(
                enabled: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                  ),
                ),
                onChanged: (String value) {
                  Trainer = value;
                },
              ),
              Text(
                '*Только для события "Тренировка"',
                style: TextStyle(color: Colors.black54),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text('Дата События:'),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(1000, 50),
                    alignment: Alignment.center,
                    primary: Colors.deepPurpleAccent, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () async {
                    final initialDate = DateTime.now();
                    final newDate = await showDatePicker(
                        context: context,
                        initialDate: initialDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 5));
                    if (newDate == null) return;
                    setState(() {
                      date = newDate;
                    });
                  },
                  child: Text('${getText()}')),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text('Время события:'),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(125, 50),
                        alignment: Alignment.center,
                        primary: Colors.deepPurpleAccent, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () async {
                        final initialTime = TimeOfDay.now();
                        final newTime = await showTimePicker(
                            context: context, initialTime: initialTime);
                        if (newTime == null) return;
                        setState(() {
                          time = newTime;
                        });
                      },
                      child: Text('${getTextTime()}')),
                  Icon(
                    Icons.remove_outlined,
                    color: Colors.black54,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(125, 50),
                        alignment: Alignment.center,
                        primary: Colors.deepPurpleAccent, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () async {
                        final initialTime = TimeOfDay.now();
                        final newTime2 = await showTimePicker(
                            context: context, initialTime: initialTime);
                        if (newTime2 == null) return;
                        setState(() {
                          timeEnd = newTime2;
                        });
                      },
                      child: Text('${getTextTimeEnd()}')),
                ],
              ),
              Text(
                '*Время конца события обязательно только для события "Тренировка"',
                style: TextStyle(color: Colors.black54),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text('Комментарий к событию:'),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              TextField(
                enabled: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                  ),
                ),
                onChanged: (String value) {
                  comment = value;
                },
              ),
              Text(
                '*Комментарий к событию не обязателен',
                style: TextStyle(color: Colors.black54),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(1000, 50),
                    alignment: Alignment.center,
                    primary: Colors.deepPurpleAccent, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    if (EventType == '') {
                      Fluttertoast.showToast(
                          msg: 'Выберите тип события',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      if (EventType == 'Тренировка') {
                        DateAndTimeStart = DateTime(
                          date!.year,
                          date!.month,
                          date!.day,
                          time!.hour,
                          time!.minute,
                        );

                        DateAndTimeEnd = DateTime(
                          date!.year,
                          date!.month,
                          date!.day,
                          timeEnd!.hour,
                          timeEnd!.minute,
                        );

                        if (DateAndTimeStart!.isBefore(DateAndTimeEnd!)) {
                          FirebaseFirestore.instance.collection('Events').add({
                            'EventType': EventType,
                            'Trainer': Trainer,
                            'place': place,
                            'comment': comment,
                            'DateAndTimeStart': DateAndTimeStart,
                            'DateAndTimeEnd': DateAndTimeEnd,
                          });
                          Navigator.of(context).pop();
                        } else {
                          Fluttertoast.showToast(
                              msg:
                                  'Начало тренировки должно быть раньше окончания',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      } else {
                        DateAndTimeStart = DateTime(
                          date!.year,
                          date!.month,
                          date!.day,
                          time!.hour,
                          time!.minute,
                        );

                        FirebaseFirestore.instance.collection('Events').add({
                          'EventType': EventType,
                          'place': place,
                          'comment': comment,
                          'DateAndTimeStart': DateAndTimeStart,
                        });
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: Text('Создать событие')),
            ],
          )
        ],
      ),
    );
  }
}
