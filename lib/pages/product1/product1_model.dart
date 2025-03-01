import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'product1_widget.dart' show Product1Widget;
import 'package:flutter/material.dart';

class Product1Model extends FlutterFlowModel<Product1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
