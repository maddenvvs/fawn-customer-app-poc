import 'package:fawn_customer/components/Home/CoffeeShopTitle.dart';
import 'package:fawn_customer/components/Home/OrderButton.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
              margin: const EdgeInsets.only(bottom: 32.0),
              child: CoffeeShopTitle(),
            ),
            OrderButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/startNewOrder");
              },
            ),
          ],
        ),
      ),
    );
  }
}
