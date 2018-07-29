import 'package:fawn_customer/backend/models/GoodsItemDTO.dart';
import 'package:flutter/material.dart';

class GoodsMenu extends StatelessWidget {
  final List<GoodsItemDTO> goodsList;
  final bool isLoaded;

  GoodsMenu({
    @required this.goodsList,
    @required this.isLoaded,
  }) : assert(isLoaded != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        centerTitle: true,
      ),
      body: Center(
        child: isLoaded ? CircularProgressIndicator() : _buildGoodsList(),
      ),
      persistentFooterButtons: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.local_grocery_store),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildGoodsList() {
    return ListView(
      children: goodsList
          .map(
            (g) => ListTile(
                  title: Text(g.name),
                  subtitle: g.description == null ? null : Text(g.description),
                  trailing: Text(g.price.toString()),
                ),
          )
          .toList(),
    );
  }
}
