import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic.dart';
import 'my_home_page.dart';
import 'mytimer.dart';
import 'remaining_time.dart';

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
          child: MyHomePage(title: 'Flutter Timer'),
        ));
  }
}
