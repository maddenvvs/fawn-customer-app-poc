import 'package:flutter/material.dart';

class GoodsMenu extends StatelessWidget {
  final List<dynamic> goodsList;
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
    );
  }

  Widget _buildGoodsList() => Text("TBD");
}
