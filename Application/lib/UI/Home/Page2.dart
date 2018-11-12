import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  String displayName;
  String displayPhoto;
  String emailId;

  Future<FirebaseUser> _getUserData() async {
    user = await _auth.currentUser();
    return user;
  }

  void loadMedHistory() {
    Navigator.of(context).pushNamed('/MedHistory');
  }

  void _signOut() async {
    _auth.signOut().whenComplete(() {
      googleSignIn.signOut();
    });
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/SignIn', (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();
    _getUserData().then((user) {
      setState(() {
        displayName = user.displayName;
        displayPhoto = user.photoUrl;
        emailId = user.email;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    double uni_width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Image(
          image: AssetImage(
            'assets/Room1.jpg',
          ),
          colorBlendMode: BlendMode.darken,
          color: Colors.black54,
        ),
        Padding(
          padding: EdgeInsets.only(top: uni_height / 5, left: uni_width / 12),
          child: Container(
            height: uni_height / 2.8,
            width: uni_width / 1.2,
            child: Card(
              elevation: 10.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: uni_height / 7, left: uni_width / 2.6),
          child: ClipOval(
            child: Container(
              height: uni_height / 6.9565,
              width: uni_width / 3.613,
              child: _loadImage(),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: uni_height / 3.2, left: uni_width / 3.5),
          child: Column(
            children: <Widget>[
              displayName == null
                  ? CircularProgressIndicator()
                  : Text(
                      displayName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
              Padding(padding: EdgeInsets.only(top: uni_height / 70)),
              emailId == null
                  ? CircularProgressIndicator()
                  : Text(
                      "Email: " + emailId,
                      style: TextStyle(fontSize: 14.0),
                    ),
              Padding(
                padding: EdgeInsets.only(top: uni_height / 125),
                child: Text(
                  'Aadhar: ' + '499118665246',
                  style: TextStyle(
                      fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          EdgeInsets.only(top: uni_height / 2.45, left: uni_width / 5.5),
          child: Row(
            children: <Widget>[
              ImageIcon(
                new AssetImage('assets/hospital.png'),
                size: (uni_height * uni_width) / 4000,
                color: Colors.black45,
              ),
              Padding(
                padding: EdgeInsets.only(left: uni_width / 20),
              ),
              Text(
                'MedRooms',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'Flamante',
                    color: Colors.black45),
              )
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: uni_height / 1.65, left: uni_width / 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: uni_height/15,
                    width: uni_width/2.5,
                    child: RaisedButton(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.green[400],
                      onPressed: () => loadMedHistory(),
                      child: Text(
                        'Medical History',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nexa',
                            fontSize: 14.0),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: uni_width/10),),
                  Container(
                    height: uni_height/15,
                    width: uni_width/2.5,
                    child: RaisedButton(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.green[400],
                      onPressed: () {
                        Navigator.of(context).pushNamed('/MedRoomForm');
                      },
                      child: Text(
                        'Register Rooms',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nexa',
                            fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: uni_height/25)),
              Row(
                children: <Widget>[
                  Container(
                    height: uni_height/15,
                    width: uni_width/2.5,
                    child: RaisedButton(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.green[400],
                      onPressed: () {
                        Navigator.of(context).pushNamed('/HospitalForm');
                      },
                      child: Text(
                        'Register Hospital',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nexa',
                            fontSize: 14.0),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: uni_width/10),),
                  Container(
                    height: uni_height/15,
                    width: uni_width/2.5,
                    child: RaisedButton(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.green[400],
                      onPressed: () {
                        _signOut();
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nexa',
                            fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _loadImage() {
    Image image;
    try {
      image = Image.network(
        displayPhoto,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      print(e);
    }
    return CircularProgressIndicator();
  }
}
