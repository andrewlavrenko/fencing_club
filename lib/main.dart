import 'package:fencing_club/pages/competition.dart';
import 'package:fencing_club/pages/competition_trainer.dart';
import 'package:fencing_club/pages/createEvent.dart';
import 'package:fencing_club/pages/edit_competition.dart';
import 'package:fencing_club/pages/edit_training.dart';
import 'package:fencing_club/pages/landing2.dart';
import 'package:fencing_club/pages/loadin_page2.dart';
import 'package:fencing_club/pages/loading_page.dart';
import 'package:fencing_club/pages/medical_certificates_card.dart';
import 'package:fencing_club/pages/profile_card.dart';
import 'package:fencing_club/pages/profile_trainer.dart';
import 'package:fencing_club/pages/schedule_trainer.dart';
import 'package:fencing_club/pages/training.dart';
import 'package:fencing_club/pages/training_trainer.dart';
import 'package:fencing_club/pages/users_trainer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fencing_club/pages/registration.dart';
import 'package:fencing_club/pages/landing.dart';
import 'package:fencing_club/pages/authentication.dart';
import 'package:fencing_club/pages/edit_profile.dart';
import 'package:fencing_club/pages/contributions.dart';
import 'package:fencing_club/pages/medical_certificates.dart';
import 'package:fencing_club/pages/profile.dart';
import 'package:fencing_club/pages/schedule.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    FencingClub(),
  );
}

class FencingClub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
      ),
      initialRoute: '/landing',
      routes: {

        '/usersT': (context) => users_trainer(),
        '/createEvent': (context) => createEvent(),
        '/medicalСertificatesСard': (context) => medical_certificates_card(),
        '/competitionCard': (context) => competitionCard(),
        '/competitionCardT': (context) => competitionCardTrainer(),
        '/editCompetition': (context) => editCompetition(),
        '/trainingCard': (context) => trainingCard(),
        '/trainingCardT': (context) => trainingCardTrainer(),
        '/editTraining': (context) => editTraining(),
        '/loading': (context) => loadingPage(),
        '/loading2': (context) => loadingPage2(),
        '/landing': (context) => landing(),
        '/landing2': (context) => landing2(),
        '/auth': (context) => authentication(),
        '/reg': (context) => registration(),
        '/sched': (context) => schedule(),
        '/schedT': (context) => schedule_trainer(),
        '/prof': (context) => profile(),
        '/profT': (context) => profile_trainer(),
        '/profCard': (context) => profile_card(),
        '/ed_prof': (context) => edit_profile(),
        '/med_cer': (context) => medical_certificates(),
        '/contribut': (context) => contributions(),
      },
    );
  }
}
