// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ShippingAddressStruct extends FFFirebaseStruct {
  ShippingAddressStruct({
    String? recipientName,
    String? phoneNumber,
    String? postalCode,
    String? addressLine1,
    String? addressLine2,
    bool? isDefault,
    String? memo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _recipientName = recipientName,
        _phoneNumber = phoneNumber,
        _postalCode = postalCode,
        _addressLine1 = addressLine1,
        _addressLine2 = addressLine2,
        _isDefault = isDefault,
        _memo = memo,
        super(firestoreUtilData);

  // "recipientName" field.
  String? _recipientName;
  String get recipientName => _recipientName ?? '';
  set recipientName(String? val) => _recipientName = val;

  bool hasRecipientName() => _recipientName != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "postalCode" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  set postalCode(String? val) => _postalCode = val;

  bool hasPostalCode() => _postalCode != null;

  // "addressLine1" field.
  String? _addressLine1;
  String get addressLine1 => _addressLine1 ?? '';
  set addressLine1(String? val) => _addressLine1 = val;

  bool hasAddressLine1() => _addressLine1 != null;

  // "addressLine2" field.
  String? _addressLine2;
  String get addressLine2 => _addressLine2 ?? '';
  set addressLine2(String? val) => _addressLine2 = val;

  bool hasAddressLine2() => _addressLine2 != null;

  // "isDefault" field.
  bool? _isDefault;
  bool get isDefault => _isDefault ?? false;
  set isDefault(bool? val) => _isDefault = val;

  bool hasIsDefault() => _isDefault != null;

  // "memo" field.
  String? _memo;
  String get memo => _memo ?? '';
  set memo(String? val) => _memo = val;

  bool hasMemo() => _memo != null;

  static ShippingAddressStruct fromMap(Map<String, dynamic> data) =>
      ShippingAddressStruct(
        recipientName: data['recipientName'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        postalCode: data['postalCode'] as String?,
        addressLine1: data['addressLine1'] as String?,
        addressLine2: data['addressLine2'] as String?,
        isDefault: data['isDefault'] as bool?,
        memo: data['memo'] as String?,
      );

  static ShippingAddressStruct? maybeFromMap(dynamic data) => data is Map
      ? ShippingAddressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'recipientName': _recipientName,
        'phoneNumber': _phoneNumber,
        'postalCode': _postalCode,
        'addressLine1': _addressLine1,
        'addressLine2': _addressLine2,
        'isDefault': _isDefault,
        'memo': _memo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'recipientName': serializeParam(
          _recipientName,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'postalCode': serializeParam(
          _postalCode,
          ParamType.String,
        ),
        'addressLine1': serializeParam(
          _addressLine1,
          ParamType.String,
        ),
        'addressLine2': serializeParam(
          _addressLine2,
          ParamType.String,
        ),
        'isDefault': serializeParam(
          _isDefault,
          ParamType.bool,
        ),
        'memo': serializeParam(
          _memo,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShippingAddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShippingAddressStruct(
        recipientName: deserializeParam(
          data['recipientName'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        postalCode: deserializeParam(
          data['postalCode'],
          ParamType.String,
          false,
        ),
        addressLine1: deserializeParam(
          data['addressLine1'],
          ParamType.String,
          false,
        ),
        addressLine2: deserializeParam(
          data['addressLine2'],
          ParamType.String,
          false,
        ),
        isDefault: deserializeParam(
          data['isDefault'],
          ParamType.bool,
          false,
        ),
        memo: deserializeParam(
          data['memo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ShippingAddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShippingAddressStruct &&
        recipientName == other.recipientName &&
        phoneNumber == other.phoneNumber &&
        postalCode == other.postalCode &&
        addressLine1 == other.addressLine1 &&
        addressLine2 == other.addressLine2 &&
        isDefault == other.isDefault &&
        memo == other.memo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        recipientName,
        phoneNumber,
        postalCode,
        addressLine1,
        addressLine2,
        isDefault,
        memo
      ]);
}

ShippingAddressStruct createShippingAddressStruct({
  String? recipientName,
  String? phoneNumber,
  String? postalCode,
  String? addressLine1,
  String? addressLine2,
  bool? isDefault,
  String? memo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShippingAddressStruct(
      recipientName: recipientName,
      phoneNumber: phoneNumber,
      postalCode: postalCode,
      addressLine1: addressLine1,
      addressLine2: addressLine2,
      isDefault: isDefault,
      memo: memo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShippingAddressStruct? updateShippingAddressStruct(
  ShippingAddressStruct? shippingAddress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shippingAddress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShippingAddressStructData(
  Map<String, dynamic> firestoreData,
  ShippingAddressStruct? shippingAddress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shippingAddress == null) {
    return;
  }
  if (shippingAddress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shippingAddress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shippingAddressData =
      getShippingAddressFirestoreData(shippingAddress, forFieldValue);
  final nestedData =
      shippingAddressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = shippingAddress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShippingAddressFirestoreData(
  ShippingAddressStruct? shippingAddress, [
  bool forFieldValue = false,
]) {
  if (shippingAddress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shippingAddress.toMap());

  // Add any Firestore field values
  shippingAddress.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShippingAddressListFirestoreData(
  List<ShippingAddressStruct>? shippingAddresss,
) =>
    shippingAddresss
        ?.map((e) => getShippingAddressFirestoreData(e, true))
        .toList() ??
    [];
