import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WishlistsRecord extends FirestoreRecord {
  WishlistsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "product_Id" field.
  DocumentReference? _productId;
  DocumentReference? get productId => _productId;
  bool hasProductId() => _productId != null;

  // "addedAt" field.
  DateTime? _addedAt;
  DateTime? get addedAt => _addedAt;
  bool hasAddedAt() => _addedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _productId = snapshotData['product_Id'] as DocumentReference?;
    _addedAt = snapshotData['addedAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Wishlists')
          : FirebaseFirestore.instance.collectionGroup('Wishlists');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Wishlists').doc(id);

  static Stream<WishlistsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WishlistsRecord.fromSnapshot(s));

  static Future<WishlistsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WishlistsRecord.fromSnapshot(s));

  static WishlistsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WishlistsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WishlistsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WishlistsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WishlistsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WishlistsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWishlistsRecordData({
  DocumentReference? productId,
  DateTime? addedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_Id': productId,
      'addedAt': addedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class WishlistsRecordDocumentEquality implements Equality<WishlistsRecord> {
  const WishlistsRecordDocumentEquality();

  @override
  bool equals(WishlistsRecord? e1, WishlistsRecord? e2) {
    return e1?.productId == e2?.productId && e1?.addedAt == e2?.addedAt;
  }

  @override
  int hash(WishlistsRecord? e) =>
      const ListEquality().hash([e?.productId, e?.addedAt]);

  @override
  bool isValidKey(Object? o) => o is WishlistsRecord;
}
