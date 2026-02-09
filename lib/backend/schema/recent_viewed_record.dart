import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecentViewedRecord extends FirestoreRecord {
  RecentViewedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "viewed_at" field.
  DateTime? _viewedAt;
  DateTime? get viewedAt => _viewedAt;
  bool hasViewedAt() => _viewedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _viewedAt = snapshotData['viewed_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('recent_viewed')
          : FirebaseFirestore.instance.collectionGroup('recent_viewed');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('recent_viewed').doc(id);

  static Stream<RecentViewedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecentViewedRecord.fromSnapshot(s));

  static Future<RecentViewedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecentViewedRecord.fromSnapshot(s));

  static RecentViewedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecentViewedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecentViewedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecentViewedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecentViewedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecentViewedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecentViewedRecordData({
  DocumentReference? productRef,
  DateTime? viewedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'productRef': productRef,
      'viewed_at': viewedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecentViewedRecordDocumentEquality
    implements Equality<RecentViewedRecord> {
  const RecentViewedRecordDocumentEquality();

  @override
  bool equals(RecentViewedRecord? e1, RecentViewedRecord? e2) {
    return e1?.productRef == e2?.productRef && e1?.viewedAt == e2?.viewedAt;
  }

  @override
  int hash(RecentViewedRecord? e) =>
      const ListEquality().hash([e?.productRef, e?.viewedAt]);

  @override
  bool isValidKey(Object? o) => o is RecentViewedRecord;
}
