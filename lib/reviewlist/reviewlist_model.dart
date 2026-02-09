import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'reviewlist_widget.dart' show ReviewlistWidget;
import 'package:flutter/material.dart';

class ReviewlistModel extends FlutterFlowModel<ReviewlistWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Reviewlist widget.
  ProductsRecord? productRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Reviewlist widget.
  List<ReviewsRecord>? reviewRef;
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
