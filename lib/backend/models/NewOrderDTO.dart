import 'package:fawn_customer/backend/models/GoodsToOrderDTO.dart';

class NewOrderDTO {
  final bool isPaid;
  final List<GoodsToOrderDTO> orders;

  NewOrderDTO({
    this.isPaid = false,
  })  : assert(isPaid != null),
        orders = List<GoodsToOrderDTO>();

  void addGoods(GoodsToOrderDTO goods) {
    assert(goods != null);

    orders.add(goods);
  }

  Map toJson() => {
        "isPaid": isPaid,
        "goods": orders.map((o) => o.toJson()).toList(),
      };
}
