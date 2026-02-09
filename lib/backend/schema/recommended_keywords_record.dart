import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecommendedKeywordsRecord extends FirestoreRecord {
  RecommendedKeywordsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "term" field.
  String? _term;
  String get term => _term ?? '';
  bool hasTerm() => _term != null;

  // "priority" field.
  int? _priority;
  int get priority => _priority ?? 0;
  bool hasPriority() => _priority != null;

  void _initializeFields() {
    _term = snapshotData['term'] as String?;
    _priority = castToType<int>(snapshotData['priority']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recommended_keywords');

  static Stream<RecommendedKeywordsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecommendedKeywordsRecord.fromSnapshot(s));

  static Future<RecommendedKeywordsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RecommendedKeywordsRecord.fromSnapshot(s));

  static RecommendedKeywordsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecommendedKeywordsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecommendedKeywordsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecommendedKeywordsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecommendedKeywordsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecommendedKeywordsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecommendedKeywordsRecordData({
  String? term,
  int? priority,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'term': term,
      'priority': priority,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecommendedKeywordsRecordDocumentEquality
    implements Equality<RecommendedKeywordsRecord> {
  const RecommendedKeywordsRecordDocumentEquality();

  @override
  bool equals(RecommendedKeywordsRecord? e1, RecommendedKeywordsRecord? e2) {
    return e1?.term == e2?.term && e1?.priority == e2?.priority;
  }

  @override
  int hash(RecommendedKeywordsRecord? e) =>
      const ListEquality().hash([e?.term, e?.priority]);

  @override
  bool isValidKey(Object? o) => o is RecommendedKeywordsRecord;
}
