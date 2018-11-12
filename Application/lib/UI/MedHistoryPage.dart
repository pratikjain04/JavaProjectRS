import 'package:flutter/material.dart';
import '../Generic/History.dart';

List<Widget> historyCardGen(List<History> lh) {
  List<Widget> widgetList = new List<Widget>();
  for (History h in lh)
    widgetList.add(new HistoryCard(h));
  return widgetList;
}

class MedHistoryPage extends StatefulWidget {
  @override
  _MedHistoryPageState createState() => _MedHistoryPageState();
}

class _MedHistoryPageState extends State<MedHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Medical History"), centerTitle: true),
      body: new SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: historyCardGen(testHist)
          ),
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {

  History history;
  HistoryCard(this.history);



  String separatedListProvider(List<String> s) {
    String ret = "" ;
    for (int i=0;i<s.length;i++) {
      ret += (i==(s.length-1))?s[i]:(s[i] + ", ");
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            new Text(history.hospital.name, style: new TextStyle(fontSize: 30.0)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Text("Diseases Treated: "),
                      new Text(separatedListProvider(history.hospital.diseasesTreated)),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Text("Medicines Prescribed: "),
                      new Text(separatedListProvider(history.hospital.medicinesPrescribed)),
                    ],
                  )
                ],
              ),
            )

          ],
        ),
      )
    );
  }


}
