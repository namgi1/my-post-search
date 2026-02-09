import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_products_widget.dart' show AllProductsWidget;
import 'package:flutter/material.dart';

class AllProductsModel extends FlutterFlowModel<AllProductsWidget> {
  ///  Local state fields for this page.

  String selectedSubCategory = '';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in AllProducts widget.
  List<ProductsRecord>? cheapproducts;
  // Stores action output result for [Firestore Query - Query a collection] action in AllProducts widget.
  List<ProductsRecord>? topSalesproducts;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
