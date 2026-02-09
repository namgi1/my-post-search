import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mypage_widget.dart' show MypageWidget;
import 'package:flutter/material.dart';

class MypageModel extends FlutterFlowModel<MypageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Mypage widget.
  DeliverySearchRecord? tKey;
  // Stores action output result for [Firestore Query - Query a collection] action in Mypage widget.
  List<RecentViewedRecord>? recentView;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
