import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'product_registration_widget.dart' show ProductRegistrationWidget;
import 'package:flutter/material.dart';

class ProductRegistrationModel
    extends FlutterFlowModel<ProductRegistrationWidget> {
  ///  Local state fields for this page.

  String category = '\"\"';

  String productName = '\"\"';

  String brandName = '\"\"';

  String imageUrl = '\"\"';

  String halalCertUrl = '\"\"';

  String description = '\"\"';

  List<String> descriptionUrls = [];
  void addToDescriptionUrls(String item) => descriptionUrls.add(item);
  void removeFromDescriptionUrls(String item) => descriptionUrls.remove(item);
  void removeAtIndexFromDescriptionUrls(int index) =>
      descriptionUrls.removeAt(index);
  void insertAtIndexInDescriptionUrls(int index, String item) =>
      descriptionUrls.insert(index, item);
  void updateDescriptionUrlsAtIndex(int index, Function(String) updateFn) =>
      descriptionUrls[index] = updateFn(descriptionUrls[index]);

  int? createdAt = 0;

  int? stock = 0;

  double? price = 0.0;

  double discountedPrice = 0.0;

  double? discount = 0.0;

  FFUploadedFile? imagefile;

  FFUploadedFile? halalcertfile;

  List<FFUploadedFile> discriptionfile = [];
  void addToDiscriptionfile(FFUploadedFile item) => discriptionfile.add(item);
  void removeFromDiscriptionfile(FFUploadedFile item) =>
      discriptionfile.remove(item);
  void removeAtIndexFromDiscriptionfile(int index) =>
      discriptionfile.removeAt(index);
  void insertAtIndexInDiscriptionfile(int index, FFUploadedFile item) =>
      discriptionfile.insert(index, item);
  void updateDiscriptionfileAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      discriptionfile[index] = updateFn(discriptionfile[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  bool isDataUploading3 = false;
  List<FFUploadedFile> uploadedLocalFiles3 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textFieldTextController?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();
  }
}
