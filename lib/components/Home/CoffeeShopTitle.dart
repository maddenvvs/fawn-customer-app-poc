import 'package:flutter/material.dart';

class CoffeeShopTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: <Widget>[
        new Text(
          "Alice in",
          style: theme.textTheme.display2,
        ),
        new Text(
          "Wonderland",
          style: theme.textTheme.display2,
        ),
      ],
    );
  }
}
