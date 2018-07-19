import 'package:fawn_customer/components/App/App.dart';
import 'package:fawn_customer/epics/epics.dart';
import 'package:fawn_customer/models/models.dart';
import 'package:fawn_customer/reducers/AppStateReducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:http/http.dart' as http;

// void main() => runApp(new FawnCustomerApp());
void main() => runApp(new Root());

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  final http.Client _httpClient = http.Client();

  final store = Store<AppState>(
    appStateReducer,
    initialState: AppState.debug(),
    middleware: [
      EpicMiddleware(createEpic()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: App(),
    );
  }

  @override
  void dispose() {
    _httpClient.close();

    super.dispose();
  }
}
