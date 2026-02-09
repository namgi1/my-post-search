import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'order_detail_widget.dart' show OrderDetailWidget;
import 'package:flutter/material.dart';

class OrderDetailModel extends FlutterFlowModel<OrderDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in OrderDetail widget.
  OrdersRecord? paymentsuccess;
  // Stores action output result for [Firestore Query - Query a collection] action in OrderDetail widget.
  ReviewsRecord? reviewRef;
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

  /// Action blocks.
  Future as(BuildContext context) async {}
}
