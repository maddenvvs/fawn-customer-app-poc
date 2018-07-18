import 'dart:async';

import 'package:fawn_customer/AppConfiguration.dart';
import 'package:fawn_customer/backend/ApiService.dart';
import 'package:fawn_customer/components/OrderDetailsInfo.dart';
import 'package:fawn_customer/models/Order.dart';
import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  final AppConfiguration configuration;
  final ApiService apiService;
  final Order order;

  OrderStatus({
    @required this.configuration,
    @required this.apiService,
    @required this.order,
  })  : assert(configuration != null),
        assert(apiService != null),
        assert(order?.id != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          builder: (context, snapshot) {
            return _buildAppBarTitle(snapshot.data);
          },
          initialData: 0,
          stream: pollOrderStatus(),
        ),
        centerTitle: true,
        leading: new IconButton(
          icon: const BackButtonIcon(),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () {
            _handleCancelOrder(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: OrderDetailsInfo(
          order: order,
        ),
      ),
      bottomNavigationBar: RaisedButton(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Cancel order",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {
          _handleCancelOrder(context);
        },
      ),
    );
  }

  void _handleCancelOrder(BuildContext context) async {
    final wantToCancel = await showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: new Text("Cancel the order"),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text("Do you really want to cancel the order?"),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: new Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            FlatButton(
              child: new Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );

    if (wantToCancel) {
      await apiService.cancelOrderById(order.id);
      Navigator.of(context).pop();
    }
  }

  Widget _buildAppBarTitle(int orderStatusCode) {
    final orderStatusString = _getHumanOrderStatus(orderStatusCode);

    return Text("Order status: $orderStatusString");
  }

  String _getHumanOrderStatus(int orderStatusCode) {
    switch (orderStatusCode) {
      case 0:
        return "New";
      case 1:
        return "In progress";
      case 2:
        return "Done";
      case 3:
        return "Cancelled";
      default:
        return "Unknown";
    }
  }

  static int statusCount = 0;

  Stream<int> pollOrderStatus() async* {
    while (true) {
      await Future.delayed(Duration(
        seconds: configuration.orderStatusPollingPeriodInSeconds,
      ));

      print("Retrieving order status '${++statusCount}'...");
      var status = await apiService.getOrderStatusCode(order.id);
      yield status.code;
    }
  }
}
