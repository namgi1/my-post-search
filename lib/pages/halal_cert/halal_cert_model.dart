import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'halal_cert_widget.dart' show HalalCertWidget;
import 'package:flutter/material.dart';

class HalalCertModel extends FlutterFlowModel<HalalCertWidget> {
  ///  Local state fields for this page.

  List<dynamic> kmflist = [];
  void addToKmflist(dynamic item) => kmflist.add(item);
  void removeFromKmflist(dynamic item) => kmflist.remove(item);
  void removeAtIndexFromKmflist(int index) => kmflist.removeAt(index);
  void insertAtIndexInKmflist(int index, dynamic item) =>
      kmflist.insert(index, item);
  void updateKmflistAtIndex(int index, Function(dynamic) updateFn) =>
      kmflist[index] = updateFn(kmflist[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (KMFList)] action in HalalCert widget.
  ApiCallResponse? apiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
