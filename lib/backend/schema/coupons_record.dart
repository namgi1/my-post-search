import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponsRecord extends FirestoreRecord {
  CouponsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "discount_value" field.
  int? _discountValue;
  int get discountValue => _discountValue ?? 0;
  bool hasDiscountValue() => _discountValue != null;

  // "is_used" field.
  bool? _isUsed;
  bool get isUsed => _isUsed ?? false;
  bool hasIsUsed() => _isUsed != null;

  // "used_at" field.
  DateTime? _usedAt;
  DateTime? get usedAt => _usedAt;
  bool hasUsedAt() => _usedAt != null;

  // "expires_at" field.
  DateTime? _expiresAt;
  DateTime? get expiresAt => _expiresAt;
  bool hasExpiresAt() => _expiresAt != null;

  // "issued_at" field.
  DateTime? _issuedAt;
  DateTime? get issuedAt => _issuedAt;
  bool hasIssuedAt() => _issuedAt != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _code = snapshotData['code'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _discountValue = castToType<int>(snapshotData['discount_value']);
    _isUsed = snapshotData['is_used'] as bool?;
    _usedAt = snapshotData['used_at'] as DateTime?;
    _expiresAt = snapshotData['expires_at'] as DateTime?;
    _issuedAt = snapshotData['issued_at'] as DateTime?;
    _orderId = snapshotData['order_id'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('coupons')
          : FirebaseFirestore.instance.collectionGroup('coupons');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('coupons').doc(id);

  static Stream<CouponsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CouponsRecord.fromSnapshot(s));

  static Future<CouponsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CouponsRecord.fromSnapshot(s));

  static CouponsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CouponsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CouponsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CouponsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CouponsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CouponsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCouponsRecordData({
  String? code,
  String? title,
  String? description,
  int? discountValue,
  bool? isUsed,
  DateTime? usedAt,
  DateTime? expiresAt,
  DateTime? issuedAt,
  String? orderId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'title': title,
      'description': description,
      'discount_value': discountValue,
      'is_used': isUsed,
      'used_at': usedAt,
      'expires_at': expiresAt,
      'issued_at': issuedAt,
      'order_id': orderId,
    }.withoutNulls,
  );

  return firestoreData;
}

class CouponsRecordDocumentEquality implements Equality<CouponsRecord> {
  const CouponsRecordDocumentEquality();

  @override
  bool equals(CouponsRecord? e1, CouponsRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.discountValue == e2?.discountValue &&
        e1?.isUsed == e2?.isUsed &&
        e1?.usedAt == e2?.usedAt &&
        e1?.expiresAt == e2?.expiresAt &&
        e1?.issuedAt == e2?.issuedAt &&
        e1?.orderId == e2?.orderId;
  }

  @override
  int hash(CouponsRecord? e) => const ListEquality().hash([
        e?.code,
        e?.title,
        e?.description,
        e?.discountValue,
        e?.isUsed,
        e?.usedAt,
        e?.expiresAt,
        e?.issuedAt,
        e?.orderId
      ]);

  @override
  bool isValidKey(Object? o) => o is CouponsRecord;
}
