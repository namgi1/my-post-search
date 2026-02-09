import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressesRecord extends FirestoreRecord {
  AddressesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "detail_address" field.
  String? _detailAddress;
  String get detailAddress => _detailAddress ?? '';
  bool hasDetailAddress() => _detailAddress != null;

  // "is_default" field.
  bool? _isDefault;
  bool get isDefault => _isDefault ?? false;
  bool hasIsDefault() => _isDefault != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "postal_code" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  bool hasPostalCode() => _postalCode != null;

  // "created_At" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "road_address" field.
  String? _roadAddress;
  String get roadAddress => _roadAddress ?? '';
  bool hasRoadAddress() => _roadAddress != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _address = snapshotData['address'] as String?;
    _detailAddress = snapshotData['detail_address'] as String?;
    _isDefault = snapshotData['is_default'] as bool?;
    _name = snapshotData['name'] as String?;
    _phone = snapshotData['phone'] as String?;
    _postalCode = snapshotData['postal_code'] as String?;
    _createdAt = snapshotData['created_At'] as DateTime?;
    _roadAddress = snapshotData['road_address'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('addresses')
          : FirebaseFirestore.instance.collectionGroup('addresses');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('addresses').doc(id);

  static Stream<AddressesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AddressesRecord.fromSnapshot(s));

  static Future<AddressesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AddressesRecord.fromSnapshot(s));

  static AddressesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AddressesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AddressesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AddressesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AddressesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AddressesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAddressesRecordData({
  String? address,
  String? detailAddress,
  bool? isDefault,
  String? name,
  String? phone,
  String? postalCode,
  DateTime? createdAt,
  String? roadAddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address': address,
      'detail_address': detailAddress,
      'is_default': isDefault,
      'name': name,
      'phone': phone,
      'postal_code': postalCode,
      'created_At': createdAt,
      'road_address': roadAddress,
    }.withoutNulls,
  );

  return firestoreData;
}

class AddressesRecordDocumentEquality implements Equality<AddressesRecord> {
  const AddressesRecordDocumentEquality();

  @override
  bool equals(AddressesRecord? e1, AddressesRecord? e2) {
    return e1?.address == e2?.address &&
        e1?.detailAddress == e2?.detailAddress &&
        e1?.isDefault == e2?.isDefault &&
        e1?.name == e2?.name &&
        e1?.phone == e2?.phone &&
        e1?.postalCode == e2?.postalCode &&
        e1?.createdAt == e2?.createdAt &&
        e1?.roadAddress == e2?.roadAddress;
  }

  @override
  int hash(AddressesRecord? e) => const ListEquality().hash([
        e?.address,
        e?.detailAddress,
        e?.isDefault,
        e?.name,
        e?.phone,
        e?.postalCode,
        e?.createdAt,
        e?.roadAddress
      ]);

  @override
  bool isValidKey(Object? o) => o is AddressesRecord;
}
