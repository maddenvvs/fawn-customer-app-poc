import 'package:fawn_customer/components/OrderDetailsInfo.dart';
import 'package:fawn_customer/models/Order.dart';
import 'package:fawn_customer/types/types.dart';
import 'package:flutter/material.dart';

class ApproveOrder extends StatelessWidget {
  final Order order;
  final ApproveNewOrderCallback onApproveOrderPressed;

  ApproveOrder({
    @required this.order,
    @required this.onApproveOrderPressed,
  })  : assert(order != null),
        assert(onApproveOrderPressed != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order details"),
        centerTitle: true,
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
          "Approve the order",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {
          onApproveOrderPressed(context, order);
        },
      ),
    );
  }
}
