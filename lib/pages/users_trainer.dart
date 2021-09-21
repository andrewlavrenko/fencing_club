import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fencing_club/auxiliaryfunctions/give_and_return_data.dart';
import 'package:flutter/material.dart';

class users_trainer extends StatefulWidget {
  @override
  _users_trainerState createState() => _users_trainerState();
}

class _users_trainerState extends State<users_trainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Пользователи',
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
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .orderBy("isTrainer", descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (snapshot.data!.docs[index].get('isTrainer')) {
                      return Padding(
                        key: Key(snapshot.data!.docs[index].id),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            trailing: Icon(
                              Icons.person,
                              color: Colors.deepPurpleAccent,
                            ),
                            title: Text('Тренер'),
                            subtitle: Text(
                                '${snapshot.data!.docs[index].get('surname')} ' +
                                    '${snapshot.data!.docs[index].get('name')} ' +
                                    '${snapshot.data!.docs[index].get('patronymic')}'),
                            onTap: () {
                              giveDataProfCard(
                                snapshot.data!.docs[index].id,
                                snapshot.data!.docs[index].get('name'),
                                snapshot.data!.docs[index].get('surname'),
                                snapshot.data!.docs[index].get('patronymic'),
                                snapshot.data!.docs[index].get('gender'),
                                snapshot.data!.docs[index].get('hand'),
                                snapshot.data!.docs[index].get('address'),
                                snapshot.data!.docs[index].get('telephone'),
                                snapshot.data!.docs[index].get('email'),
                                snapshot.data!.docs[index].get('fencingJacketSize'),
                                snapshot.data!.docs[index].get('fencingProtectionSize'),
                                snapshot.data!.docs[index].get('fencingPantsSize'),
                                snapshot.data!.docs[index].get('fencingMaskSize'),
                                snapshot.data!.docs[index].get('isTrainer'),
                              );

                              Navigator.pushNamedAndRemoveUntil(context,
                                  '/profCard', (route) => true);
                            },
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        key: Key(snapshot.data!.docs[index].id),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            trailing: Icon(
                              Icons.person_outline_outlined,
                              color: Colors.deepPurpleAccent,
                            ),
                            title: Text('Член клуба'),
                            subtitle: Text(
                                '${snapshot.data!.docs[index].get('surname')} ' +
                                    '${snapshot.data!.docs[index].get('name')} ' +
                                    '${snapshot.data!.docs[index].get('patronymic')}'),
                            onTap: () {
                              giveDataProfCard(
                                snapshot.data!.docs[index].id,
                                snapshot.data!.docs[index].get('name'),
                                snapshot.data!.docs[index].get('surname'),
                                snapshot.data!.docs[index].get('patronymic'),
                                snapshot.data!.docs[index].get('gender'),
                                snapshot.data!.docs[index].get('hand'),
                                snapshot.data!.docs[index].get('address'),
                                snapshot.data!.docs[index].get('telephone'),
                                snapshot.data!.docs[index].get('email'),
                                snapshot.data!.docs[index].get('fencingJacketSize'),
                                snapshot.data!.docs[index].get('fencingProtectionSize'),
                                snapshot.data!.docs[index].get('fencingPantsSize'),
                                snapshot.data!.docs[index].get('fencingMaskSize'),
                                snapshot.data!.docs[index].get('isTrainer'),
                              );

                              Navigator.pushNamedAndRemoveUntil(context,
                                  '/profCard', (route) => true);
                            },
                          ),
                        ),
                      );
                    }
                  });
            } else {
              return SizedBox();
            }
          }),
    );
  }
}
