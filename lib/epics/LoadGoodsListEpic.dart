import 'dart:async';

import 'package:fawn_customer/actions/actions.dart';
import 'package:fawn_customer/backend/models/GoodsItemDTO.dart';
import 'package:fawn_customer/models/models.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class LoadGoodsListEpic extends EpicClass<AppState> {
  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return Observable(actions).ofType(TypeToken<LoadGoodsList>()).switchMap(
          (_) => Observable.fromFuture(
                Future
                    .delayed(Duration(seconds: 3))
                    .then((_) => LoadGoodsListSuccess(List<GoodsItemDTO>())),
              ),
        );
  }
}
