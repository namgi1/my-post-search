import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'product_list_category_widget.dart' show ProductListCategoryWidget;
import 'package:flutter/material.dart';

class ProductListCategoryModel
    extends FlutterFlowModel<ProductListCategoryWidget> {
  ///  Local state fields for this page.

  String selectedSubCategory = '';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ProductList_category widget.
  List<ProductsRecord>? allproducts;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
