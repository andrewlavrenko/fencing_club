import 'package:cloud_firestore/cloud_firestore.dart';

String IdT = '';
String eventTypeT = '';
String trainerT = '';
String placeT = '';
String CommentT = '';
Timestamp? startT;
Timestamp? endT;

String IdC = '';
String eventTypeC = '';
String placeC = '';
String CommentC = '';
Timestamp? startC;

String IdP = '';
String nameP = '';
String surnameP = '';
String patronymicP = '';
String genderP = '';
String handP = '';
String addressP = '';
String telephoneP = '';
String emailP = '';
String fencingJacketSizeP = '';
String fencingProtectionSizeP = '';
String fencingPantsSizeP = '';
String fencingMaskSizeP = '';
bool isTrainerP = false;

giveDataTraining(String id, String a, String b, String c, Timestamp? d,
    Timestamp? e, String f) {
  IdT = id;
  eventTypeT = a;
  trainerT = b;
  placeT = c;
  startT = d;
  endT = e;
  CommentT = f;
}

returnDataTraining() {
  List Trainingdata = [
    IdT,
    eventTypeT,
    trainerT,
    placeT,
    startT,
    endT,
    CommentT
  ];
  return Trainingdata;
}

giveDataCompetition(
  String id,
  String a,
  String b,
  String c,
  Timestamp? d,
) {
  IdC = id;
  eventTypeC = a;
  placeC = b;
  CommentC = c;
  startC = d;
}

returnDataCompetition() {
  List Competitiondata = [IdC, eventTypeC, placeC, CommentC, startC];
  return Competitiondata;
}

giveDataProfCard(String id, String  a, String  b, String  c, String  d, String  e, String  f, String  g, String  h, String  i, String  j, String  k, String  l, bool m) {
  IdP = id;
  nameP = a;
  surnameP = b;
  patronymicP = c;
  genderP = d;
  handP = e;
  addressP = f;
  telephoneP = g;
  emailP = h;
  fencingJacketSizeP = i;
  fencingProtectionSizeP = j;
  fencingPantsSizeP = k;
  fencingMaskSizeP = l;
  isTrainerP = m;
}

returnDataProfCard() {
  List ProfCarddata = [IdP, nameP, surnameP, patronymicP, genderP, handP, addressP, telephoneP, emailP, fencingJacketSizeP, fencingProtectionSizeP, fencingPantsSizeP, fencingMaskSizeP, isTrainerP];
  return ProfCarddata;
}

giveDataMedCer() {}

returnDataMedCer() {}
