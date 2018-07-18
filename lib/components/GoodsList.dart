import 'package:fawn_customer/backend/models/GoodsItemDTO.dart';
import 'package:fawn_customer/types/types.dart';
import 'package:flutter/material.dart';

class GoodsList extends StatelessWidget {
  final List<GoodsItemDTO> goodsList;
  final AddGoodsItemCallback handleGoodsItemTap;

  GoodsList(
    this.goodsList,
    this.handleGoodsItemTap,
  )   : assert(goodsList != null),
        assert(handleGoodsItemTap != null);

  @override
  Widget build(BuildContext context) {
    var children = goodsList.map((f) => GoodsListItem(
          f,
          handleGoodsItemTap,
        ));

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: ListTile
          .divideTiles(
            context: context,
            tiles: children,
          )
          .toList(),
    );
  }
}

class GoodsListItem extends StatelessWidget {
  final GoodsItemDTO goodsItem;
  final AddGoodsItemCallback handleGoodsItemTap;

  static TextStyle itemTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  GoodsListItem(
    this.goodsItem,
    this.handleGoodsItemTap,
  )   : assert(goodsItem != null),
        assert(handleGoodsItemTap != null);

  void _handleItemTap() {
    handleGoodsItemTap(goodsItem);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // contentPadding: EdgeInsets.all(16.0),
      title: Text(
        goodsItem.name,
        style: itemTextStyle,
      ),
      trailing: Text(
        goodsItem.price.toString(),
        style: itemTextStyle,
      ),
      onTap: _handleItemTap,
    );
  }
}
