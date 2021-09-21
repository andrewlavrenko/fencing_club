import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fencing_club/auxiliaryfunctions/give_and_return_data.dart';
import 'package:fencing_club/timeConvert/timeConvert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class editCompetition extends StatefulWidget {
  const editCompetition({Key? key}) : super(key: key);

  @override
  _editCompetitionState createState() => _editCompetitionState();
}

class _editCompetitionState extends State<editCompetition> {
  List ECD = returnDataCompetition();
  DateTime? date = null;
  DateTime? DateAndTimeStart = null;
  TimeOfDay? time = null;
  String EventType = '';
  String place = '';
  String Trainer = '';
  String comment = '';

  String getText() {
    if( time == null){
      if (date == null) {
        return '${formateDate(ECD[4])}';
      } else {
        return '${formateDate1(date)}';
      }
    }else{
      if (date == null) {
        return 'Выберите дату';
      } else {
        return '${formateDate1(date)}';
      }
    }

  }

  String getTextTime() {
    if(date==null){
      if (time == null) {
        return '${formateTime(ECD[4])}';
      } else {
        final hours = time!.hour.toString().padLeft(2, '0');
        final minutes = time!.minute.toString().padLeft(2, '0');
        return '$hours:$minutes';
      }
    }else{
      if (time == null) {
        return 'Выберите время';
      } else {
        final hours = time!.hour.toString().padLeft(2, '0');
        final minutes = time!.minute.toString().padLeft(2, '0');
        return '$hours:$minutes';
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    place = ECD[2];
    comment = ECD[3];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Редактирование',
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
              Text('Место проведения:'),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              TextFormField(
                enabled: true,
                initialValue:'${ECD[2]}',
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
              Text('Время начала:'),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(1000, 50),
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
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text('Комментарий к событию:'),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              TextFormField(
                enabled: true,
                initialValue:'${ECD[3]}',
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
                    if(place==''){
                      Fluttertoast.showToast(
                          msg: 'Заполните поле "Место проведения".',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }else{
                      if(date!=null&&time==null||date==null&&time!=null){
                        Fluttertoast.showToast(
                            msg: 'При изменении даты необходимо подтвердить выбор времени и наоборот.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }else{
                        if(date==null&&time==null){
                          FirebaseFirestore.instance.collection('Events').doc(ECD[0]).update({
                            'place': place,
                            'comment': comment,
                            'DateAndTimeStart': ECD[4],
                          });
                          Navigator.of(context).pop();
                        }else{
                          DateAndTimeStart = DateTime(
                            date!.year,
                            date!.month,
                            date!.day,
                            time!.hour,
                            time!.minute,
                          );

                          FirebaseFirestore.instance.collection('Events').doc(ECD[0]).update({
                            'place': place,
                            'comment': comment,
                            'DateAndTimeStart': DateAndTimeStart,
                          });
                          Navigator.of(context).pop();

                        }
                      }
                    }
                  },
                  child: Text('Сохранить')),
            ],
          )
        ],
      ),
    );
  }
}
