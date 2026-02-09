import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'order_list_widget.dart' show OrderListWidget;
import 'package:flutter/material.dart';

class OrderListModel extends FlutterFlowModel<OrderListWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in OrderList widget.
  List<OrdersRecord>? orderList;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ProductsRecord? productRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CartItemsRecord? cartQueryResult;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  CartItemsRecord? addCart;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
