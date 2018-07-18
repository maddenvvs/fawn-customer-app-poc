import 'package:fawn_customer/backend/models/GoodsItemDTO.dart';
import 'package:meta/meta.dart';

class GoodsItem {
  final int id;
  final String name;
  final double itemPrice;

  GoodsItem({
    @required this.id,
    @required this.name,
    @required this.itemPrice,
  })  : assert(id != null),
        assert(name != null),
        assert(itemPrice != null);

  GoodsItem.fromDTO(GoodsItemDTO dto)
      : this(
          id: dto.id,
          name: dto.name,
          itemPrice: dto.price,
        );
}
