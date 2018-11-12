import 'package:flutter/material.dart';
import 'UI/Book/login.dart';
import 'UI/SplashScreen/splash_screen.dart';
import 'package:flutter/services.dart';
import 'UI/Forms/hospital_form.dart';
import 'UI/Forms/emergency_form.dart';
import 'UI/Forms/medroom_form.dart';
import 'UI/Home/HomePage.dart';
import 'UI/EvaluationPage/under_evaluation.dart';
import 'UI/EvaluationPage/Taxi Evaluation.dart';
import 'UI/EvaluationPage/RoomBookEvaluation.dart';
import 'UI/MedHistoryPage.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .whenComplete(() {
    runApp(new MyApp());
  });
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool userSignedIn = false;

  @override
  void initState() {
    super.initState();
    _auth.currentUser().then((user){
      if(user != null)
        userSignedIn = true;
      else
        userSignedIn = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MedRooms',
      theme: new ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreenAccent,
      ),
      routes: <String, WidgetBuilder>{
        '/SignIn': (BuildContext context) => new SignIn(
            action: (BuildContext _context) => Navigator.of(_context)
                .pushNamedAndRemoveUntil(
                '/HomePage', (Route<dynamic> route) => false)),
        '/SignInEmergency': (BuildContext context) => new SignIn(
            action: (BuildContext _context) => Navigator.of(_context)
                .pushNamedAndRemoveUntil(
                '/EmergencyForm', (Route<dynamic> route) => false)),
        '/RegRoom': (BuildContext context) => new SignIn(
            action: (BuildContext _context) => Navigator.of(_context)
                .pushNamedAndRemoveUntil(
                '/MedRoomForm', (Route<dynamic> route) => false)),
        '/RegHospital': (BuildContext context) => new SignIn(
            action: (BuildContext _context) => Navigator.of(_context)
                .pushNamedAndRemoveUntil(
                '/HospitalForm', (Route<dynamic> route) => false)),
        '/HospitalForm': (BuildContext context) => new HospitalForm(),
        '/MedRoomForm': (BuildContext context) => new MedRoomForm(),
        '/EmergencyForm': (BuildContext context) => new EmergencyForm(),
        '/HomePage': (BuildContext context) => new HomePage(),
        '/UnderEvaluation': (BuildContext context) => new UnderEvalutaion(),
        '/TaxiEvaluation': (BuildContext context) => new TaxiEvalutaion(),
        '/RoomEvaluation': (BuildContext context) => new RoomBookEvalutaion(),
        '/MedHistory': (BuildContext context) => new MedHistoryPage(),
      },
      home: new SplashScreen(),
    );
  }


}
