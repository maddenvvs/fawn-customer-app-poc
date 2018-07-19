import 'package:fawn_customer/models/models.dart';
import 'package:fawn_customer/reducers/reducers.dart';

AppState appStateReducer(AppState state, action) {
  return new AppState(
    configuration: appConfigReducer(state.configuration, action),
    goodsListState: goodsListReducer(state.goodsListState, action),
  );
}
