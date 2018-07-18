import 'package:meta/meta.dart';

class GoodsToOrderDTO {
  final int id;
  final int amount;
  final double itemPrice;

  GoodsToOrderDTO({
    @required this.id,
    @required this.amount,
    @required this.itemPrice,
  })  : assert(id != null),
        assert(amount != null),
        assert(itemPrice != null);

  Map toJson() => {
        "id": id,
        "amount": amount,
        "itemPrice": itemPrice,
      };
}
