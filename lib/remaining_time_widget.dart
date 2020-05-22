import 'package:flutter/material.dart';

class RemainingTimeWidget extends StatelessWidget {
  final int value;

  const RemainingTimeWidget({
    Key key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '$value',
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
