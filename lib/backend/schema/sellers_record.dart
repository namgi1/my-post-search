import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SellersRecord extends FirestoreRecord {
  SellersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "businessNumber" field.
  String? _businessNumber;
  String get businessNumber => _businessNumber ?? '';
  bool hasBusinessNumber() => _businessNumber != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "TelemarketingNumber" field.
  String? _telemarketingNumber;
  String get telemarketingNumber => _telemarketingNumber ?? '';
  bool hasTelemarketingNumber() => _telemarketingNumber != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['displayName'] as String?;
    _companyName = snapshotData['companyName'] as String?;
    _businessNumber = snapshotData['businessNumber'] as String?;
    _phoneNumber = snapshotData['phoneNumber'] as String?;
    _telemarketingNumber = snapshotData['TelemarketingNumber'] as String?;
    _address = snapshotData['address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sellers');

  static Stream<SellersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SellersRecord.fromSnapshot(s));

  static Future<SellersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SellersRecord.fromSnapshot(s));

  static SellersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SellersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SellersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SellersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SellersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SellersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSellersRecordData({
  String? email,
  String? displayName,
  String? companyName,
  String? businessNumber,
  String? phoneNumber,
  String? telemarketingNumber,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'displayName': displayName,
      'companyName': companyName,
      'businessNumber': businessNumber,
      'phoneNumber': phoneNumber,
      'TelemarketingNumber': telemarketingNumber,
      'address': address,
    }.withoutNulls,
  );

  return firestoreData;
}

class SellersRecordDocumentEquality implements Equality<SellersRecord> {
  const SellersRecordDocumentEquality();

  @override
  bool equals(SellersRecord? e1, SellersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.companyName == e2?.companyName &&
        e1?.businessNumber == e2?.businessNumber &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.telemarketingNumber == e2?.telemarketingNumber &&
        e1?.address == e2?.address;
  }

  @override
  int hash(SellersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.companyName,
        e?.businessNumber,
        e?.phoneNumber,
        e?.telemarketingNumber,
        e?.address
      ]);

  @override
  bool isValidKey(Object? o) => o is SellersRecord;
}
