// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ShippingAddressStruct extends FFFirebaseStruct {
  ShippingAddressStruct({
    String? address,
    String? detailAddress,
    String? name,
    String? phone,
    String? roadAddress,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _address = address,
        _detailAddress = detailAddress,
        _name = name,
        _phone = phone,
        _roadAddress = roadAddress,
        super(firestoreUtilData);

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "detail_address" field.
  String? _detailAddress;
  String get detailAddress => _detailAddress ?? '';
  set detailAddress(String? val) => _detailAddress = val;

  bool hasDetailAddress() => _detailAddress != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "road_address" field.
  String? _roadAddress;
  String get roadAddress => _roadAddress ?? '';
  set roadAddress(String? val) => _roadAddress = val;

  bool hasRoadAddress() => _roadAddress != null;

  static ShippingAddressStruct fromMap(Map<String, dynamic> data) =>
      ShippingAddressStruct(
        address: data['address'] as String?,
        detailAddress: data['detail_address'] as String?,
        name: data['name'] as String?,
        phone: data['phone'] as String?,
        roadAddress: data['road_address'] as String?,
      );

  static ShippingAddressStruct? maybeFromMap(dynamic data) => data is Map
      ? ShippingAddressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'address': _address,
        'detail_address': _detailAddress,
        'name': _name,
        'phone': _phone,
        'road_address': _roadAddress,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'detail_address': serializeParam(
          _detailAddress,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'road_address': serializeParam(
          _roadAddress,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShippingAddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShippingAddressStruct(
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        detailAddress: deserializeParam(
          data['detail_address'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        roadAddress: deserializeParam(
          data['road_address'],
          ParamType.String,
          false,
        ),
      );

  static ShippingAddressStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ShippingAddressStruct(
        address: convertAlgoliaParam(
          data['address'],
          ParamType.String,
          false,
        ),
        detailAddress: convertAlgoliaParam(
          data['detail_address'],
          ParamType.String,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone: convertAlgoliaParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        roadAddress: convertAlgoliaParam(
          data['road_address'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ShippingAddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShippingAddressStruct &&
        address == other.address &&
        detailAddress == other.detailAddress &&
        name == other.name &&
        phone == other.phone &&
        roadAddress == other.roadAddress;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([address, detailAddress, name, phone, roadAddress]);
}

ShippingAddressStruct createShippingAddressStruct({
  String? address,
  String? detailAddress,
  String? name,
  String? phone,
  String? roadAddress,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShippingAddressStruct(
      address: address,
      detailAddress: detailAddress,
      name: name,
      phone: phone,
      roadAddress: roadAddress,
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
