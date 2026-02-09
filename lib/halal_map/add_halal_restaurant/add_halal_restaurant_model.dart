import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_halal_restaurant_widget.dart' show AddHalalRestaurantWidget;
import 'package:flutter/material.dart';

class AddHalalRestaurantModel
    extends FlutterFlowModel<AddHalalRestaurantWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  HalalMapRecord? overlap;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  HalalMapRecord? createdocument;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
