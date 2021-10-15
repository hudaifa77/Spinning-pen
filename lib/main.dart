import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  final StreamController _dividerController = StreamController<int>();


  dispose() {
    _dividerController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffB0F9D2), elevation: 0.0),
      backgroundColor: Color(0xffB0F9D2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinningWheel(
              Image.asset('assets/images/pen.png'),
              // Image.asset('assets/images/news.png'),
              width: 310,
              height: 310,
              initialSpinAngle: 10,
              spinResistance: 0.2,
              canInteractWhileSpinning: false,
              dividers: 16,
              onUpdate: _dividerController.add,
              onEnd: _dividerController.add,
            ),
            StreamBuilder(
              stream: _dividerController.stream,
              builder: (context, snapshot) =>
                  snapshot.hasData ? BasicScore(snapshot.data) : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class BasicScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: 'North',
    2: 'North',
    3: 'West',
    4: 'West',
    5: 'West',
    6: 'West',
    7: 'South',
    8: 'South',
    9: 'South',
    10: 'South',
    11: 'East',
    12: 'East',
    13: 'East',
    14: 'East',
    15: 'North',
    16: 'North',
  };

  BasicScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic));
  }
}
