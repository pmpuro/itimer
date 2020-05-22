import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic.dart';
import 'my_home_page.dart';
import 'mytimer.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiProvider(
          providers: [
            Provider<ActivityLogic>(
                create: (context) => ActivityLogic(MyTimer())),
            Provider<RestLogic>(create: (context) => RestLogic(MyTimer()))
          ],
          child: MyHomePage(title: 'Flutter Timer'),
        ));
  }
}
