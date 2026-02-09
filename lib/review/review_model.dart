import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'review_widget.dart' show ReviewWidget;
import 'package:flutter/material.dart';

class ReviewModel extends FlutterFlowModel<ReviewWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Review widget.
  ReviewsRecord? reviewRef;
  // Stores action output result for [Backend Call - Read Document] action in Review widget.
  ProductsRecord? productRef;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadDataT3s = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataT3s = [];
  List<String> uploadedFileUrls_uploadDataT3s = [];

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReviewsRecord? createReview;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
