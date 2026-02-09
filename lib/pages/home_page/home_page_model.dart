import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<ProductsRecord>? topSalesproducts;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<ProductsRecord>? cheapproducts;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  DeliverySearchRecord? tKey;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
