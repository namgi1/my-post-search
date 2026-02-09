import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecentKeywordsRecord extends FirestoreRecord {
  RecentKeywordsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "term" field.
  String? _term;
  String get term => _term ?? '';
  bool hasTerm() => _term != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _term = snapshotData['term'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('recent_keywords')
          : FirebaseFirestore.instance.collectionGroup('recent_keywords');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('recent_keywords').doc(id);

  static Stream<RecentKeywordsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecentKeywordsRecord.fromSnapshot(s));

  static Future<RecentKeywordsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecentKeywordsRecord.fromSnapshot(s));

  static RecentKeywordsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecentKeywordsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecentKeywordsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecentKeywordsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecentKeywordsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecentKeywordsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecentKeywordsRecordData({
  String? term,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'term': term,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecentKeywordsRecordDocumentEquality
    implements Equality<RecentKeywordsRecord> {
  const RecentKeywordsRecordDocumentEquality();

  @override
  bool equals(RecentKeywordsRecord? e1, RecentKeywordsRecord? e2) {
    return e1?.term == e2?.term && e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(RecentKeywordsRecord? e) =>
      const ListEquality().hash([e?.term, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is RecentKeywordsRecord;
}
