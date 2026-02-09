import '/backend/backend.dart';
import '/components/quantity_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  int productAmount = 0;

  int deliveryFee = 0;

  int cartAmount = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Cart widget.
  List<CartItemsRecord>? cartItem;
  // Models for quantity dynamic component.
  late FlutterFlowDynamicModels<QuantityModel> quantityModels;
  List<CartItemsRecord>? textPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  AddressesRecord? existAddress;

  @override
  void initState(BuildContext context) {
    quantityModels = FlutterFlowDynamicModels(() => QuantityModel());
  }

  @override
  void dispose() {
    quantityModels.dispose();
  }
}
