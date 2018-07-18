import 'dart:collection';

import 'package:fawn_customer/backend/models/GoodsToOrderDTO.dart';
import 'package:fawn_customer/backend/models/NewOrderDTO.dart';
import 'package:fawn_customer/models/GoodsItem.dart';

class Order {
  static bool _areGoodsEqual(GoodsItem g1, GoodsItem g2) => g1.id == g2.id;
  static int _hashCode(GoodsItem item) => item.id.hashCode;

  final LinkedHashMap<GoodsItem, int> _orderedItems = LinkedHashMap(
    equals: _areGoodsEqual,
    hashCode: _hashCode,
  );

  int id;

  void addGoodsItem(GoodsItem item) {
    assert(item != null);

    _orderedItems.putIfAbsent(item, () => 0);
    _orderedItems[item] += 1;
  }

  Iterable<GoodsItem> goodsInOrder() => _orderedItems.keys;

  int get totalItems => _orderedItems.length == 0
      ? 0
      : _orderedItems.entries
          .map(
            (p) => p.value,
          )
          .reduce(
            (a, b) => a + b,
          );

  int goodsCount(GoodsItem item) {
    assert(item != null);

    if (_orderedItems.containsKey(item)) {
      return _orderedItems[item];
    }

    return 0;
  }

  NewOrderDTO toDTO() {
    final newOrder = NewOrderDTO();

    for (var goodsItem in _orderedItems.entries) {
      newOrder.addGoods(
        GoodsToOrderDTO(
          id: goodsItem.key.id,
          itemPrice: goodsItem.key.itemPrice,
          amount: goodsItem.value,
        ),
      );
    }

    return newOrder;
  }
}
