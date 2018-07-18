import 'package:fawn_customer/backend/models/GoodsItemDTO.dart';
import 'package:fawn_customer/models/Order.dart';
import 'package:flutter/widgets.dart';

typedef void AddGoodsItemCallback(GoodsItemDTO goodsItem);

typedef void CreateNewOrderCallback(BuildContext context);

typedef void ApproveNewOrderCallback(BuildContext context, Order order);
