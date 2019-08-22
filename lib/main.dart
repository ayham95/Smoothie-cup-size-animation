import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int state = 0;
  String _animationName = 'idle';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 60),
                  child: SafeArea(
                      child: Text(
                    'Hello Ayham,',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Choose your cup size,',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: FlareActor(
                    'assets/cup_size.flr',
                    animation: _animationName,

                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.indigo[800],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)),
                boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black54)]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizeButton(
                  selected: state == 1 || state == 0,
                  text: 'S',
                  onTap: () {
                    state = 1;
                    onTap();
                  },
                ),
                SizeButton(
                  selected: state == 2,
                  text: 'L',
                  onTap: () {
                    state = 2;
                    onTap();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  onTap() {
    if (state == 0) {
      setState(() {
        _animationName = 'idle';
      });
    }
    if (state == 1) {
      setState(() {
        _animationName = 'large_to_small';
      });
    } else {
      setState(() {
        _animationName = 'small_to_large';
      });
    }
  }
}

class SizeButton extends StatelessWidget {
  final bool selected;
  final Function onTap;
  final String text;

  const SizeButton({Key key, this.selected = false, this.onTap, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.all(8),
      duration: Duration(milliseconds: 200),
      width: 60,
      height: 60,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              splashColor: Colors.pink[300],
              borderRadius: BorderRadius.all(Radius.circular(8)),
              highlightColor: Colors.pink[200],
              onTap: onTap,
              child: Center(
                  child: Text(
                text,
                style: TextStyle(
                    color: selected ? Colors.white70 : Colors.pink[300],
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              )))),
      decoration: selected
          ? BoxDecoration(
              color: Colors.pink[200],
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                  BoxShadow(
                    color: Colors.pink[200],
                    blurRadius: 12,
                  )
                ])
          : BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: Colors.pink[300],
              )),
    );
  }
}
