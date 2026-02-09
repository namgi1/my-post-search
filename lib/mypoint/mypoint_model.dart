import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mypoint_widget.dart' show MypointWidget;
import 'package:flutter/material.dart';

class MypointModel extends FlutterFlowModel<MypointWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Mypoint widget.
  UsersRecord? userRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Mypoint widget.
  List<PointsRecord>? point;
  // Stores action output result for [Backend Call - Read Document] action in Text widget.
  ReviewsRecord? reviewRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
