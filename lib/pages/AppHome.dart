import 'package:fawn_customer/AppConfiguration.dart';
import 'package:fawn_customer/components/CoffeeShopTitle.dart';
import 'package:fawn_customer/components/OrderButton.dart';
import 'package:fawn_customer/types/types.dart';
import 'package:flutter/material.dart';

class AppHome extends StatelessWidget {
  final AppConfiguration configuration;
  final CreateNewOrderCallback onNewOrderPressed;

  AppHome({
    @required this.configuration,
    @required this.onNewOrderPressed,
  })  : assert(configuration != null),
        assert(onNewOrderPressed != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: CoffeeShopTitle(),
              margin: const EdgeInsets.only(bottom: 32.0),
            ),
            OrderButton(
              onPressed: () {
                onNewOrderPressed(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
