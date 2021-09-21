import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fencing_club/timeConvert/timeConvert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class medical_certificates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Справки',
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
                      context, '/prof', (route) => false);
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
                      context, '/sched', (route) => false);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.attach_money_outlined,
                  color: Colors.deepPurpleAccent,
                ),
                title: const Text('Взносы'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/contribut', (route) => false);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.medical_services_outlined,
                  color: Colors.deepPurpleAccent,
                ),
                title: const Text('Справки'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(
                  'Users/${FirebaseAuth.instance.currentUser!.uid}/MedicalCertificates')
              .orderBy("end")
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 5, 10),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${snapshot.data!.docs[index].get('typeOfMedicalCertificate')}:',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 20)),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Text('Период действия:',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 15)),
                            Text(
                                '${formateDate(snapshot.data!.docs[index].get('start'))} - ${formateDate(snapshot.data!.docs[index].get('end'))}',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 15)),
                          ],
                        ),
                        onTap: () {
                          //giveDataMedCer(snapshot.data!.docs[index].get('EventType'),snapshot.data!.docs[index].get('place'),snapshot.data!.docs[index].get('comment'),snapshot.data!.docs[index].get('DateAndTimeStart'));
                          Navigator.pushNamedAndRemoveUntil(context,
                              '/medicalСertificatesСard', (route) => true);
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return SizedBox();
            }
          },
        ));
  }
}
