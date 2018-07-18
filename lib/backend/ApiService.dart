import 'dart:async';
import 'dart:convert';
import 'package:fawn_customer/backend/UriProvider.dart';
import 'package:fawn_customer/backend/models/NewOrderDTO.dart';
import 'package:fawn_customer/backend/models/OrderDTO.dart';
import 'package:fawn_customer/backend/models/OrderStatusDTO.dart';
import 'package:http/http.dart' as http;

import 'package:fawn_customer/backend/models/GoodsItemDTO.dart';

class ApiService {
  final UriProvider uriProvider;
  final http.Client httpClient;

  ApiService(
    this.uriProvider,
    this.httpClient,
  ) : assert(uriProvider != null);

  Future<Iterable<GoodsItemDTO>> getAllGoods() async {
    var response = await httpClient.get(
      uriProvider.goodsEndpoint,
      headers: <String, String>{
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return _parseResponse(response);
    }

    // TODO: think about exception handling
    throw Exception("Something went wrong with receiving goods list.");
  }

  List<GoodsItemDTO> _parseResponse(http.Response response) {
    List<GoodsItemDTO> goodsList = List<GoodsItemDTO>();

    for (var item in json.decode(response.body)) {
      goodsList.add(GoodsItemDTO.fromJson(item));
    }

    return goodsList;
  }

  Future<OrderStatusDTO> getOrderStatusCode(int orderId) async {
    var uriToRequest = uriProvider.orderStatusUri(
      id: orderId.toString(),
    );

    print(uriToRequest.toString());

    var response = await httpClient.get(
      uriToRequest,
      headers: <String, String>{
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return OrderStatusDTO.fromJson(decoded);
    }

    // TODO: think about exception handling
    throw Exception("Something went wrong with receiving order status info.");
  }

  Future<OrderDTO> createNewOrder(NewOrderDTO newOrder) async {
    var response = await httpClient.post(
      uriProvider.ordersEndpoint,
      body: json.encode(newOrder.toJson()),
      headers: <String, String>{
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 201) {
      final decoded = json.decode(response.body);
      return OrderDTO.fromJson(decoded);
    }

    // TODO: think about exception handling
    throw Exception("Something went wrong with creating new order.");
  }

  Future cancelOrderById(int orderId) async {
    var uriToRequest = uriProvider.cancelOrderByIdUri(
      id: orderId.toString(),
    );

    var response = await httpClient.put(
      uriToRequest,
    );

    if (response.statusCode == 204) {
      return;
    }

    // TODO: think about exception handling
    throw Exception("Something went wrong with cancelling the order.");
  }
}
