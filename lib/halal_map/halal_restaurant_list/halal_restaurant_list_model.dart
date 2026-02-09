import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'halal_restaurant_list_widget.dart' show HalalRestaurantListWidget;
import 'package:flutter/material.dart';

class HalalRestaurantListModel
    extends FlutterFlowModel<HalalRestaurantListWidget> {
  ///  Local state fields for this page.

  String? regiongroup;

  String? regiondetail;

  double? minlat;

  double? maxlat;

  double? minlng;

  double? maxlng;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<HalalMapRecord>? nearRestaurant;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
