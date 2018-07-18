import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Order details"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: RaisedButton(
                child: Text("Make an order"),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed("/currentOrder");
                },
              ),
              margin: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
              child: RaisedButton(
                child: Text("Add to order"),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed("/addToOrder");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
