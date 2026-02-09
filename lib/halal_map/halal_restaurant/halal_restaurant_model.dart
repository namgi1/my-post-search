import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'halal_restaurant_widget.dart' show HalalRestaurantWidget;
import 'package:flutter/material.dart';

class HalalRestaurantModel extends FlutterFlowModel<HalalRestaurantWidget> {
  ///  Local state fields for this page.

  bool openinghours = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in HalalRestaurant widget.
  HalalMapRecord? halalrestaurant;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
