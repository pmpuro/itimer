import 'package:flutter/material.dart';
import 'package:itimer/mytimer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic;

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiProvider(
          providers: [
            Provider<Logic>(create: (context) {
              logic = Logic(MyTimer());
              return logic;
            }),
            ChangeNotifierProvider(create: (context) {
              var remainingTime = RemainingTime();
              return remainingTime;
            }),
          ],
          child: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Logic {
  Logic(this._timer);

  MyTimer _timer;

  Stream<int> get timerValue => _timer.output();

  Stream<bool> get timerIsActive => _timer.active();

  void start(int duration) {
    _timer.start(duration);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    var logic = Provider.of<Logic>(context);
                    logic.start(10);
                    var remainingTime = Provider.of<RemainingTime>(context);
                    logic.timerValue.listen((value) {
                      remainingTime.updateTime(value);
                    });
                  },
                  child: Text('Start'),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RemainingTime extends ChangeNotifier {
  int currentValue = 0;

  int get remaining => currentValue;

  void updateTime(int newValue) {
    currentValue = newValue;
    notifyListeners();
  }
}

class RemainingTimeWidget extends StatelessWidget {
  const RemainingTimeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Consumer<RemainingTime>(builder: (context, time, child) {
          return Text(
            '${time.remaining}',
            style: Theme
                .of(context)
                .textTheme
                .headline1,
          );
        }),
      ],
    );
  }
}
