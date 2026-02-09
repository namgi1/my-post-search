import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'order_cancel_widget.dart' show OrderCancelWidget;
import 'package:flutter/material.dart';

class OrderCancelModel extends FlutterFlowModel<OrderCancelWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in OrderCancel widget.
  OrdersRecord? cancel;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future as(BuildContext context) async {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
