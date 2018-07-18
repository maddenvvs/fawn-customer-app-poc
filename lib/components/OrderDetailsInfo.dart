import 'package:fawn_customer/models/Order.dart';
import 'package:flutter/material.dart';

class OrderDetailsInfo extends StatelessWidget {
  final Order order;

  OrderDetailsInfo({
    @required this.order,
  }) : assert(order != null);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildGoodsItemsList(),
    );
  }

  List<Widget> _buildGoodsItemsList() {
    final list = List<Widget>();
    var totalPrice = 0.0;

    for (var goodsItem in order.goodsInOrder()) {
      final goodsCount = order.goodsCount(goodsItem);
      final goodsPrice = goodsCount * goodsItem.itemPrice;
      totalPrice += goodsPrice;

      list.add(ListTile(
        title: Text(goodsItem.name),
        subtitle: Text("x$goodsCount"),
        trailing: Text("$goodsPrice"),
      ));
    }

    list.add(Divider());
    list.add(ListTile(
      title: Text("Total"),
      trailing: Text("$totalPrice"),
    ));

    return list;
  }
}
