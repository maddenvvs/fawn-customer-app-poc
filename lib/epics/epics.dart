import 'package:fawn_customer/epics/LoadGoodsListEpic.dart';
import 'package:fawn_customer/epics/typedefs.dart';
import 'package:fawn_customer/models/models.dart';
import 'package:redux_epics/redux_epics.dart';

Epic<AppState> createEpic(ApiServiceFactory serviceFactory) => combineEpics([
      LoadGoodsListEpic(serviceFactory),
    ]);
