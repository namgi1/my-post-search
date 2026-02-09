import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'address_widget.dart' show AddressWidget;
import 'package:flutter/material.dart';

class AddressModel extends FlutterFlowModel<AddressWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedAddressRef;

  String? defaultAddressDelete;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Address widget.
  List<AddressesRecord>? userAddress;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
