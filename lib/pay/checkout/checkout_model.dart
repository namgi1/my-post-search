import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:flutter/material.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  Local state fields for this page.

  bool showOrderProduct = false;

  DocumentReference? selectedAddress;

  List<dynamic> itemsList = [];
  void addToItemsList(dynamic item) => itemsList.add(item);
  void removeFromItemsList(dynamic item) => itemsList.remove(item);
  void removeAtIndexFromItemsList(int index) => itemsList.removeAt(index);
  void insertAtIndexInItemsList(int index, dynamic item) =>
      itemsList.insert(index, item);
  void updateItemsListAtIndex(int index, Function(dynamic) updateFn) =>
      itemsList[index] = updateFn(itemsList[index]);

  int? productAmount;

  int deliveryFee = 0;

  int? finalAmount;

  DocumentReference? couponRef;

  int? coupondiscount = 0;

  int? pointdiscount = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Checkout widget.
  List<CartItemsRecord>? orderItem;
  // Stores action output result for [Firestore Query - Query a collection] action in Checkout widget.
  AddressesRecord? defaultAddress;
  // Stores action output result for [Bottom Sheet - AddressSelectorComponent] action in Button widget.
  DocumentReference? changeAddress;
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
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  OrdersRecord? orderDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
