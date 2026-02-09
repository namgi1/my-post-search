import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'product_list_search_widget.dart' show ProductListSearchWidget;
import 'package:flutter/material.dart';

class ProductListSearchModel extends FlutterFlowModel<ProductListSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // Algolia Search Results from action on ProductList_search
  List<ProductsRecord>? algoliaSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
