import 'package:fawn_customer/actions/actions.dart';
import 'package:fawn_customer/components/GoodsMenu/GoodsMenu.dart';
import 'package:fawn_customer/components/Home/Home.dart';
import 'package:fawn_customer/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fawn Customer App",
      theme: ThemeData.light(),
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => Home(),
        "/startNewOrder": (BuildContext context) => StoreBuilder<AppState>(
              onInit: (store) => store.dispatch(LoadGoodsList.All),
              builder: (context, store) {
                return GoodsMenu(
                  isLoaded: store.state.goodsListState.isLoaded,
                  goodsList: store.state.goodsListState.goodsList,
                );
              },
            ),
      },
    );
  }
}
