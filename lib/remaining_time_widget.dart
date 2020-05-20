import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'remaining_time.dart';

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
            style: Theme.of(context).textTheme.headline1,
          );
        }),
      ],
    );
  }
}
