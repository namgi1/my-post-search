import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_options_widget.dart' show ProductOptionsWidget;
import 'package:flutter/material.dart';

class ProductOptionsModel extends FlutterFlowModel<ProductOptionsWidget> {
  ///  Local state fields for this component.

  int? quantity;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CartItemsRecord? cartQueryResult;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  CartItemsRecord? addCart;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
