import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class EmergencyForm extends StatefulWidget {
  @override
  _EmergencyFormState createState() => _EmergencyFormState();
}

//class AppState extends InheritedWidget {
//  const AppState({
//    Key key,
//    this.mode,
//    Widget child,
//  }) : assert(mode != null),
//        assert(child != null),
//        super(key: key, child: child);
//
// final Geocoder mode;
//
//  static AppState of(BuildContext context) {
//    return context.inheritFromWidgetOfExactType(AppState);
//  }
//
//  @override
//  bool updateShouldNotify(AppState old) => mode != old.mode;
//}



class _EmergencyFormState extends State<EmergencyForm> {


  var _currentLocation = <String, double>{};
  var _location = new Location();
  final TextEditingController _controllerLongitude = new TextEditingController();
  final TextEditingController _controllerLatitude = new TextEditingController();
  List<Address> results = [];

//
//  @override
//  void initState() {
//    super.initState();
//    initPlatformState();
//
//    StreamSubscription<Map<String, double>> _locationSubscription;
//
//    _locationSubscription =
//        _location.onLocationChanged().listen((Map<String, double> result) {
//          setState(() {
//            _currentLocation = result;
//          });
//        });
//  }
//
//  initPlatformState() async {
//    Map<String, double> location;
//    // Platform messages may fail, so we use a try/catch PlatformException.
//
//  }
//
//  bool isLoading = false;
//
//  Future search() async {
//
//    this.setState(() {
//      this.isLoading = true;
//    });
//
//    try{
//      var geocoding = AppState.of(context).mode;
//      var longitude = double.parse(_controllerLongitude.text);
//      var latitude = double.parse(_controllerLatitude.text);
//    }
//    catch(e) {
//      print("Error occured: $e");
//    }
//    finally {
//      this.setState(() {
//        this.isLoading = false;
//      });
//    }
//  }


    @override
    Widget build(BuildContext context) {
      double uni_height = MediaQuery
          .of(context)
          .size
          .height;
      double uni_width = MediaQuery
          .of(context)
          .size
          .width;
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Card(
                elevation: 20.0,
                child: new Column(
                  children: <Widget>[
                    new AppBar(
                        title: new Text("Emergency Form"),
                        centerTitle: true,
                        backgroundColor: Colors.red),
                    Padding(padding: EdgeInsets.only(top: uni_height / 4)),
                    new ListTile(
                      leading: const Icon(Icons.my_location),
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Neemrana",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.person),
                      title: new TextField(
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          hintText: "Aadhar Number",
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1.0,
                    ),
                    new Padding(padding: EdgeInsets.only(top: uni_height / 25)),
                    Padding(
                      padding: EdgeInsets.only(left: uni_width / 13),
                      child: new Container(
                        height: uni_height / 10,
                        width: uni_width / 3.5,
                        child: RaisedButton(
                            color: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0)),
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 18.0,
                                  color: Colors.white,
                                  fontFamily: 'Nexa'),
                            ),
                            onPressed: () =>
                                Navigator.of(context)
                                    .pushNamedAndRemoveUntil('/HomePage',
                                        (Route<dynamic> route) => false)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
}