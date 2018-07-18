import 'package:fawn_customer/AppConfiguration.dart';
import 'package:fawn_customer/backend/ApiService.dart';
import 'package:fawn_customer/backend/UriProvider.dart';
import 'package:fawn_customer/models/Order.dart';
import 'package:fawn_customer/pages/AppHome.dart';
import 'package:fawn_customer/pages/MakeOrder.dart';
import 'package:fawn_customer/pages/OrderDetails.dart';
import 'package:fawn_customer/pages/OrderStatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class FawnCustomerApp extends StatefulWidget {
  @override
  _FawnCustomerAppState createState() => _FawnCustomerAppState();
}

class _FawnCustomerAppState extends State<FawnCustomerApp> {
  AppConfiguration _configuration = AppConfiguration(
    backendUrl: "http://10.0.2.2:5000/",
    debugShowMaterialGrid: false,
    showPerformanceOverlay: false,
    showSemanticsDebugger: false,
    orderStatusPollingPeriodInSeconds: 2,
  );

  http.Client _httpClient = http.Client();

  ThemeData get theme {
    return ThemeData.light();
  }

  ApiService get apiService {
    return ApiService(
      UriProvider.forOrigin(_configuration.backendUrl),
      _httpClient,
    );
  }

  void _handleOnNewOrderPressed(BuildContext context) {
    Navigator.of(context).pushNamed("/addToOrder");
  }

  void _handleApproveOrderPressed(BuildContext context, Order order) async {
    final orderDTO = await apiService.createNewOrder(order.toDTO());
    order.id = orderDTO.id;

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) {
          return OrderStatus(
            configuration: _configuration,
            apiService: apiService,
            order: order,
          );
        },
      ),
      (route) {
        return route.settings.name == "/";
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fawn Customer App",
      theme: theme,
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => AppHome(
              configuration: _configuration,
              onNewOrderPressed: _handleOnNewOrderPressed,
            ),
        "/addToOrder": (BuildContext context) => MakeOrder(
              configuration: _configuration,
              apiService: apiService,
              onApproveOrderPressed: _handleApproveOrderPressed,
            ),
        "/currentOrder": (BuildContext context) => OrderStatus(
              configuration: _configuration,
              apiService: apiService,
              order: null,
            ),
        "/orderDetails": (BuildContext context) => OrderDetails(),
      },
      showPerformanceOverlay: _configuration.showPerformanceOverlay,
      showSemanticsDebugger: _configuration.showSemanticsDebugger,
      debugShowMaterialGrid: _configuration.debugShowMaterialGrid,
    );
  }

  @override
  void dispose() {
    _httpClient.close();

    super.dispose();
  }
}
