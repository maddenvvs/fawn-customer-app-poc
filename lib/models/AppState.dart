import 'package:fawn_customer/models/GoodsListState.dart';
import 'package:fawn_customer/models/models.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final AppConfig configuration;
  final GoodsListState goodsListState;

  AppState({
    @required this.configuration,
    @required this.goodsListState,
  })  : assert(configuration != null),
        assert(goodsListState != null);

  AppState.debug()
      : this(
          configuration: AppConfig.debug(),
          goodsListState: GoodsListState(),
        );

  AppState.release()
      : this(
          configuration: AppConfig.release(),
          goodsListState: GoodsListState(),
        );
}
