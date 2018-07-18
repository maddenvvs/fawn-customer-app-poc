import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  final VoidCallback onPressed;

  OrderButton({
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RaisedButton(
      child: Container(
        margin: EdgeInsets.only(
          bottom: 16.0,
          top: 16.0,
        ),
        child: Text(
          "Order",
          style: theme.textTheme.display1,
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
