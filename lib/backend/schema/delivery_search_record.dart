import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliverySearchRecord extends FirestoreRecord {
  DeliverySearchRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "t_key" field.
  String? _tKey;
  String get tKey => _tKey ?? '';
  bool hasTKey() => _tKey != null;

  void _initializeFields() {
    _tKey = snapshotData['t_key'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deliverySearch');

  static Stream<DeliverySearchRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeliverySearchRecord.fromSnapshot(s));

  static Future<DeliverySearchRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeliverySearchRecord.fromSnapshot(s));

  static DeliverySearchRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeliverySearchRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeliverySearchRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeliverySearchRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeliverySearchRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeliverySearchRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeliverySearchRecordData({
  String? tKey,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      't_key': tKey,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeliverySearchRecordDocumentEquality
    implements Equality<DeliverySearchRecord> {
  const DeliverySearchRecordDocumentEquality();

  @override
  bool equals(DeliverySearchRecord? e1, DeliverySearchRecord? e2) {
    return e1?.tKey == e2?.tKey;
  }

  @override
  int hash(DeliverySearchRecord? e) => const ListEquality().hash([e?.tKey]);

  @override
  bool isValidKey(Object? o) => o is DeliverySearchRecord;
}
