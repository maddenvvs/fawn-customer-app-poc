import 'package:fawn_customer/backend/models/GoodsItemDTO.dart';
import 'package:fawn_customer/models/models.dart';

GoodsListState goodsListStateSelector(AppState state) => state.goodsListState;

List<GoodsItemDTO> goodsListSelector(AppState state) =>
    goodsListStateSelector(state).goodsList;

bool isGoodsListLoadedSelector(AppState state) =>
    goodsListStateSelector(state).isLoaded;

String apiServiceUrl(AppState state) => state.configuration.backendUrl;
