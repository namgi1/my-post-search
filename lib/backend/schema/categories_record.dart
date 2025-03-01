import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "categoryId" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  bool hasCategoryId() => _categoryId != null;

  // "categoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "parentCategoryId" field.
  String? _parentCategoryId;
  String get parentCategoryId => _parentCategoryId ?? '';
  bool hasParentCategoryId() => _parentCategoryId != null;

  void _initializeFields() {
    _categoryId = snapshotData['categoryId'] as String?;
    _categoryName = snapshotData['categoryName'] as String?;
    _parentCategoryId = snapshotData['parentCategoryId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? categoryId,
  String? categoryName,
  String? parentCategoryId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'categoryId': categoryId,
      'categoryName': categoryName,
      'parentCategoryId': parentCategoryId,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.categoryId == e2?.categoryId &&
        e1?.categoryName == e2?.categoryName &&
        e1?.parentCategoryId == e2?.parentCategoryId;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality()
      .hash([e?.categoryId, e?.categoryName, e?.parentCategoryId]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
