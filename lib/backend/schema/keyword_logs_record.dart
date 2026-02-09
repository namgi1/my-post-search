import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KeywordLogsRecord extends FirestoreRecord {
  KeywordLogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "term" field.
  String? _term;
  String get term => _term ?? '';
  bool hasTerm() => _term != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  // "lastSearched" field.
  DateTime? _lastSearched;
  DateTime? get lastSearched => _lastSearched;
  bool hasLastSearched() => _lastSearched != null;

  void _initializeFields() {
    _term = snapshotData['term'] as String?;
    _date = snapshotData['date'] as String?;
    _count = castToType<int>(snapshotData['count']);
    _lastSearched = snapshotData['lastSearched'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('keyword_logs');

  static Stream<KeywordLogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KeywordLogsRecord.fromSnapshot(s));

  static Future<KeywordLogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KeywordLogsRecord.fromSnapshot(s));

  static KeywordLogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KeywordLogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KeywordLogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KeywordLogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KeywordLogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KeywordLogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKeywordLogsRecordData({
  String? term,
  String? date,
  int? count,
  DateTime? lastSearched,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'term': term,
      'date': date,
      'count': count,
      'lastSearched': lastSearched,
    }.withoutNulls,
  );

  return firestoreData;
}

class KeywordLogsRecordDocumentEquality implements Equality<KeywordLogsRecord> {
  const KeywordLogsRecordDocumentEquality();

  @override
  bool equals(KeywordLogsRecord? e1, KeywordLogsRecord? e2) {
    return e1?.term == e2?.term &&
        e1?.date == e2?.date &&
        e1?.count == e2?.count &&
        e1?.lastSearched == e2?.lastSearched;
  }

  @override
  int hash(KeywordLogsRecord? e) =>
      const ListEquality().hash([e?.term, e?.date, e?.count, e?.lastSearched]);

  @override
  bool isValidKey(Object? o) => o is KeywordLogsRecord;
}
