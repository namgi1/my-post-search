import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PointsRecord extends FirestoreRecord {
  PointsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "orderId" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "reviewId" field.
  String? _reviewId;
  String get reviewId => _reviewId ?? '';
  bool hasReviewId() => _reviewId != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _orderId = snapshotData['orderId'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _amount = castToType<int>(snapshotData['amount']);
    _reviewId = snapshotData['reviewId'] as String?;
    _productId = snapshotData['productId'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('points')
          : FirebaseFirestore.instance.collectionGroup('points');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('points').doc(id);

  static Stream<PointsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PointsRecord.fromSnapshot(s));

  static Future<PointsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PointsRecord.fromSnapshot(s));

  static PointsRecord fromSnapshot(DocumentSnapshot snapshot) => PointsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PointsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PointsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PointsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PointsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPointsRecordData({
  String? type,
  String? orderId,
  DateTime? createdAt,
  int? amount,
  String? reviewId,
  String? productId,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'orderId': orderId,
      'created_at': createdAt,
      'amount': amount,
      'reviewId': reviewId,
      'productId': productId,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class PointsRecordDocumentEquality implements Equality<PointsRecord> {
  const PointsRecordDocumentEquality();

  @override
  bool equals(PointsRecord? e1, PointsRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.orderId == e2?.orderId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.amount == e2?.amount &&
        e1?.reviewId == e2?.reviewId &&
        e1?.productId == e2?.productId &&
        e1?.description == e2?.description;
  }

  @override
  int hash(PointsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.orderId,
        e?.createdAt,
        e?.amount,
        e?.reviewId,
        e?.productId,
        e?.description
      ]);

  @override
  bool isValidKey(Object? o) => o is PointsRecord;
}
