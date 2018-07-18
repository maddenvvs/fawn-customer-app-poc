import 'package:fawn_customer/AppConfiguration.dart';
import 'package:fawn_customer/backend/ApiService.dart';
import 'package:fawn_customer/backend/models/GoodsItemDTO.dart';
import 'package:fawn_customer/components/GoodsList.dart';
import 'package:fawn_customer/models/GoodsItem.dart';
import 'package:fawn_customer/models/Order.dart';
import 'package:fawn_customer/pages/ApproveOrder.dart';
import 'package:fawn_customer/types/types.dart';
import 'package:flutter/material.dart';

class MakeOrder extends StatefulWidget {
  final AppConfiguration configuration;
  final ApiService apiService;
  final ApproveNewOrderCallback onApproveOrderPressed;

  MakeOrder({
    @required this.configuration,
    @required this.apiService,
    @required this.onApproveOrderPressed,
  })  : assert(configuration != null),
        assert(apiService != null),
        assert(onApproveOrderPressed != null);

  @override
  _MakeOrderState createState() => _MakeOrderState();
}

class _MakeOrderState extends State<MakeOrder> {
  final Order _currentOrder = Order();

  void _handleGoodsItemPressed(GoodsItemDTO item) {
    setState(() {
      _currentOrder.addGoodsItem(GoodsItem.fromDTO(item));
    });
  }

  Widget _currentList;
  Widget _createGoodsList() {
    return _currentList ??
        FutureBuilder<Iterable<GoodsItemDTO>>(
          future: widget.apiService.getAllGoods(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                } else {
                  _currentList = GoodsList(
                    snapshot.data,
                    _handleGoodsItemPressed,
                  );

                  return _currentList;
                }
            }
          },
        );
  }

  Widget _createOrderButton(BuildContext context) {
    final ordersCount = _currentOrder.totalItems;
    final buttonCaption =
        ordersCount == 0 ? "Make an order" : "Make an order ($ordersCount)";

    return RaisedButton(
      padding: EdgeInsets.all(20.0),
      child: Text(
        buttonCaption,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () {
        if (ordersCount == 0) return;

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ApproveOrder(
                order: _currentOrder,
                onApproveOrderPressed: widget.onApproveOrderPressed,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
        ),
        centerTitle: true,
      ),
      body: _createGoodsList(),
      bottomNavigationBar: _createOrderButton(context),
    );
  }
}
