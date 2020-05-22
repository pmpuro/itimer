import 'package:flutter/material.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StreamBuilder(
                    initialData: false,
                    stream: Provider.of<ActivityLogic>(context).timerIsActive(),
                    builder: _buildActivityIndicator),
                StreamBuilder(
                    initialData: 0,
                    stream:
                        Provider.of<ActivityLogic>(context).getTimerValues(),
                    builder: _buildRemainingTimeWidget),
              ],
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _startUpdatingRemainingTime(context),
                  child: Text('Start'),
                )
              ],
            ),
            RemainingTimeWidget(value: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildRemainingTimeWidget(context, snapshot) {
    var newValue = 99;
    if (snapshot.hasData) {
      newValue = snapshot.data;
    }

    return RemainingTimeWidget(value: newValue);
  }

  Widget _buildActivityIndicator(context, snapshot) {
    var newValue = false;
    if (snapshot.data) {
      newValue = snapshot.data;
    }

    return Text("Activity: $newValue");
  }

  void _startUpdatingRemainingTime(BuildContext context) {
    var logic = Provider.of<ActivityLogic>(context);
    logic.start(10);
  }
}
