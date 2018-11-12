import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Room/room.dart';

class RoomViewWrapper extends StatelessWidget {
  Room _room;

  RoomViewWrapper(this._room);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new RoomView(_room),
    );
  }
}

class RoomView extends StatefulWidget {
  Room _room;

  RoomView(this._room);

  @override
  _RoomViewState createState() => _RoomViewState(_room);
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _RoomViewState extends State<RoomView> {

  int count = 0;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Room _room;

  _RoomViewState(this._room);

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    double uni_width = MediaQuery.of(context).size.width;
    double uni_height = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        new CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: uni_height / 2.5,
              pinned: _appBarBehavior == AppBarBehavior.pinned,
              floating: _appBarBehavior == AppBarBehavior.floating ||
                  _appBarBehavior == AppBarBehavior.snapping,
              snap: _appBarBehavior == AppBarBehavior.snapping,
              flexibleSpace: new FlexibleSpaceBar(
                title: new Text(_room.roomName, style: TextStyle(fontSize: 14.0),),
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    _room.roomImages != null
                        ? new Image.asset(
                            _room.roomImages[0],
                            fit: BoxFit.cover,
                            height: uni_height / 2.5,
                          )
                        : new Container(),
                    // This gradient ensures that the toolbar icons are distinct
                    // against the background image.
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, -0.4),
                          colors: <Color>[Color(0x60000000), Color(0x00000000)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                new AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle.dark,
                    child: new Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new DetailFlatButton(
                            icon: Icons.star,
                            content: _room.rating.toString(),
                            action: () {},
                          ),
                          categoryListWidgetProvider(
                              _room.paymentModes, Icons.account_balance_wallet),
                          new DetailFlatButton(
                            icon: Icons.payment,
                            content: _room.price.toString() + "/- per day",
                            action: () {},
                          ),
                          categoryListWidgetProvider(
                              _room.facilities, Icons.hotel),
                          new Divider(),
                          new DetailFlatButton(
                            icon: Icons.location_on,
                            content: _room.address,
                            action: () {},
                          ),
                          categoryListWidgetProvider(
                              _room.hospitalsAffiliated, Icons.local_hospital),
                          new Divider(),
                          new DetailFlatButton(
                            icon: Icons.person,
                            content: _room.personName,
                            action: () {},
                          ),
                          new DetailFlatButton(
                            icon: Icons.call,
                            content: _room.personContact,
                            action: () {},
                          ),
                          new DetailFlatButton(
                            icon: Icons.email,
                            content: _room.personEmail,
                            action: () {},
                          ),
                        ])),
              ]),
            ),
          ],
        ),
        _buildFab(uni_height),
      ],
    );
  }

  Widget _buildFab(double uni_height) {
    //starting fab position
    final double defaultTopMargin = uni_height / 2.5 - uni_height / 160;
    //pixels from top where scaling should start
    final double scaleStart = uni_height / 6.67;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return new Positioned(
      top: top,
      right: 16.0,
      child: new Transform(
        transform: new Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: new FloatingActionButton(
          onPressed: () {
              Navigator.of(context).pushNamed('/RoomEvaluation');
            },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

Widget categoryListWidgetProvider(List<String> _items, IconData icon) {
  List<Widget> ret = new List<Widget>();
  int x = 0;
  for (String str in _items) {
    ret.add(new DetailFlatButton(
        icon: (x == 0) ? icon : null, content: str, action: () {}));
    x++;
  }
  return new Column(
    children: ret,
  );
}

class DetailFlatButton extends StatelessWidget {
  String content;
  IconData icon;

  Function action;

  DetailFlatButton({this.icon, this.content, this.action});

  @override
  Widget build(BuildContext context) {
    double uni_width = MediaQuery.of(context).size.width;
    double uni_height = MediaQuery.of(context).size.height;

    return FlatButton(
      onPressed: action,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Row(
          children: <Widget>[
            (icon == null)
                ? new Padding(
                    padding: EdgeInsets.only(left: uni_width / 13.84),
                  )
                : new Icon(icon),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(children: [new Text(content)]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
