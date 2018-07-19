import 'package:fawn_customer/backend/models/GoodsItemDTO.dart';
import 'package:meta/meta.dart';

@immutable
class GoodsListState {
  final List<GoodsItemDTO> goodsList;
  final bool isLoaded;

  GoodsListState({
    this.goodsList,
    this.isLoaded = false,
  }) : assert(isLoaded != null);
}
