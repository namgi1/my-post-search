import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'selected_address_widget.dart' show SelectedAddressWidget;
import 'package:flutter/material.dart';

class SelectedAddressModel extends FlutterFlowModel<SelectedAddressWidget> {
  ///  Local state fields for this page.

  List<dynamic> keywordResult = [];
  void addToKeywordResult(dynamic item) => keywordResult.add(item);
  void removeFromKeywordResult(dynamic item) => keywordResult.remove(item);
  void removeAtIndexFromKeywordResult(int index) =>
      keywordResult.removeAt(index);
  void insertAtIndexInKeywordResult(int index, dynamic item) =>
      keywordResult.insert(index, item);
  void updateKeywordResultAtIndex(int index, Function(dynamic) updateFn) =>
      keywordResult[index] = updateFn(keywordResult[index]);

  List<dynamic> kakaoFilteredList = [];
  void addToKakaoFilteredList(dynamic item) => kakaoFilteredList.add(item);
  void removeFromKakaoFilteredList(dynamic item) =>
      kakaoFilteredList.remove(item);
  void removeAtIndexFromKakaoFilteredList(int index) =>
      kakaoFilteredList.removeAt(index);
  void insertAtIndexInKakaoFilteredList(int index, dynamic item) =>
      kakaoFilteredList.insert(index, item);
  void updateKakaoFilteredListAtIndex(int index, Function(dynamic) updateFn) =>
      kakaoFilteredList[index] = updateFn(kakaoFilteredList[index]);

  List<dynamic> addressResult = [];
  void addToAddressResult(dynamic item) => addressResult.add(item);
  void removeFromAddressResult(dynamic item) => addressResult.remove(item);
  void removeAtIndexFromAddressResult(int index) =>
      addressResult.removeAt(index);
  void insertAtIndexInAddressResult(int index, dynamic item) =>
      addressResult.insert(index, item);
  void updateAddressResultAtIndex(int index, Function(dynamic) updateFn) =>
      addressResult[index] = updateFn(addressResult[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (KakaoKeywordSearch)] action in TextField widget.
  ApiCallResponse? keywordAddress;
  // Stores action output result for [Backend Call - API (KakaoAddressSearch)] action in TextField widget.
  ApiCallResponse? address;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
