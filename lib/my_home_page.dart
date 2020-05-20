import 'package:flutter/material.dart';
import 'package:itimer/remaining_time.dart';
import 'package:itimer/remaining_time_widget.dart';
import 'package:provider/provider.dart';

import 'logic.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RemainingTimeWidget(),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _startUpdatingRemainingTime(context),
                  child: Text('Start'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _startUpdatingRemainingTime(BuildContext context) {
    var logic = Provider.of<Logic>(context);
    var remainingTime = Provider.of<RemainingTime>(context);
    logic.getTimerValues(10).listen((value) {
      remainingTime.updateTime(value);
    });
  }
}
