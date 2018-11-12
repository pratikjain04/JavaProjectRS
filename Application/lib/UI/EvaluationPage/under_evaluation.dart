import 'package:flutter/material.dart';

class UnderEvalutaion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double uni_width = MediaQuery.of(context).size.width;
    double uni_height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: uni_height / 6.4,
              width: uni_width / 3.6,
              child: Image(
                image: AssetImage('assets/tick.png'),
                fit: BoxFit.cover,
              )),
          Padding(padding: EdgeInsets.only(top: uni_height/20)),
          Padding(
            padding: EdgeInsets.only(left: uni_width/20),
            child: Text(
              'Your Application is Under Evaluation.',
              style: TextStyle(color: Colors.green, fontFamily: 'Flamante', fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}
