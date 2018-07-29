import 'dart:async';

import 'package:fawn_customer/actions/actions.dart';
import 'package:fawn_customer/backend/models/GoodsItemDTO.dart';
import 'package:fawn_customer/epics/typedefs.dart';
import 'package:fawn_customer/models/models.dart';
import 'package:fawn_customer/selectors/selectors.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class LoadGoodsListEpic extends EpicClass<AppState> {
  final ApiServiceFactory serviceFactory;

  LoadGoodsListEpic(
    this.serviceFactory,
  ) : assert(serviceFactory != null);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return Observable(actions).ofType(TypeToken<LoadGoodsList>()).switchMap(
          (_) => Observable.fromFuture(
                _fetchGoodsList(apiServiceUrl(store.state))
                    .then((goods) => LoadGoodsListSuccess(goods)),
              ),
        );
  }

  Future<List<GoodsItemDTO>> _fetchGoodsList(String serviceUri) async {
    final service = serviceFactory(serviceUri);

    return await service.getAllGoods();
  }
}
