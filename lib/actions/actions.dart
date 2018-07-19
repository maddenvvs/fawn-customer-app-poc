import 'package:fawn_customer/backend/models/GoodsItemDTO.dart';

enum LoadGoodsList {
  All,
}

class LoadGoodsListSuccess {
  final List<GoodsItemDTO> goodsList;

  LoadGoodsListSuccess(this.goodsList);
}
