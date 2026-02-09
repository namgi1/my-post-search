import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'halal_restaurant_search_widget.dart' show HalalRestaurantSearchWidget;
import 'package:flutter/material.dart';

class HalalRestaurantSearchModel
    extends FlutterFlowModel<HalalRestaurantSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (googlemap)] action in TextField widget.
  ApiCallResponse? apiResults25;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
