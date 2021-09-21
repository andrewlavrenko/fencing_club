import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fencing_club/auxiliaryfunctions/give_and_return_data.dart';
import 'package:fencing_club/timeConvert/timeConvert.dart';
import 'package:flutter/material.dart';

class schedule_trainer extends StatefulWidget {
  @override
  _schedule_trainerState createState() => _schedule_trainerState();
}

class _schedule_trainerState extends State<schedule_trainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Расписание',
            style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
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
                Navigator.pushNamedAndRemoveUntil(
                    context, '/profT', (route) => false);
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Events")
              .orderBy("DateAndTimeStart")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              int i = 0;
              int kol = 0;
              DateTime date = DateTime.now();
              while (i < snapshot.data!.docs.length) {
                if (DateTime.fromMillisecondsSinceEpoch(
                        snapshot.data!.docs[i].get('DateAndTimeStart').seconds *
                            1000)
                    .isBefore(date)) {
                  kol++;
                }
                i++;
              }
              if (kol != snapshot.data!.docs.length) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (!DateTime.fromMillisecondsSinceEpoch(snapshot
                                  .data!.docs[index]
                                  .get('DateAndTimeStart')
                                  .seconds *
                              1000)
                          .isBefore(date)) {
                        if (snapshot.data!.docs[index].get('EventType') ==
                            'Соревнование') {
                          return Padding(
                            key: Key(snapshot.data!.docs[index].id),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(formateDate(snapshot.data!.docs[index]
                                    .get('DateAndTimeStart'))),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    trailing: Icon(
                                      Icons.equalizer_outlined,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    title: Text('Соревнование'),
                                    subtitle: Text(
                                        '${formateTime(snapshot.data!.docs[index].get('DateAndTimeStart'))}'),
                                    onTap: () {
                                      giveDataCompetition(
                                          snapshot.data!.docs[index].id,
                                          snapshot.data!.docs[index]
                                              .get('EventType'),
                                          snapshot.data!.docs[index]
                                              .get('place'),
                                          snapshot.data!.docs[index]
                                              .get('comment'),
                                          snapshot.data!.docs[index]
                                              .get('DateAndTimeStart'));
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          '/competitionCardT', (route) => true);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Padding(
                            key: Key(snapshot.data!.docs[index].id),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(formateDate(snapshot.data!.docs[index]
                                    .get('DateAndTimeStart'))),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    trailing: Icon(
                                      Icons.fitness_center_outlined,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    title: Text('Тренировка'),
                                    subtitle: Text(
                                        '${formateTime(snapshot.data!.docs[index].get('DateAndTimeStart'))} - ${formateTime(snapshot.data!.docs[index].get('DateAndTimeEnd'))}'),
                                    onTap: () {
                                      giveDataTraining(
                                          snapshot.data!.docs[index].id,
                                          snapshot.data!.docs[index]
                                              .get('EventType'),
                                          snapshot.data!.docs[index]
                                              .get('Trainer'),
                                          snapshot.data!.docs[index]
                                              .get('place'),
                                          snapshot.data!.docs[index]
                                              .get('DateAndTimeStart'),
                                          snapshot.data!.docs[index]
                                              .get('DateAndTimeEnd'),
                                          snapshot.data!.docs[index]
                                              .get('comment'));
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          '/trainingCardT', (route) => true);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      } else {
                        return SizedBox();
                      }
                    });
              } else {
                return SizedBox();
              }
            } else {
              return SizedBox();
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/createEvent', (route) => true);
        },
        child: Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
