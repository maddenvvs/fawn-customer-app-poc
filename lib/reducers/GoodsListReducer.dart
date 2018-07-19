import 'package:fawn_customer/actions/actions.dart';
import 'package:fawn_customer/models/GoodsListState.dart';

GoodsListState goodsListReducer(GoodsListState state, action) {
  if (action is LoadGoodsList) {
    return new GoodsListState(
      goodsList: null,
      isLoaded: true,
    );
  } else if (action is LoadGoodsListSuccess) {
    return new GoodsListState(
      goodsList: action.goodsList,
      isLoaded: false,
    );
  }

  return state;
}
