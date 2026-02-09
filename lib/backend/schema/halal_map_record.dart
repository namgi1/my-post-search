import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HalalMapRecord extends FirestoreRecord {
  HalalMapRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  bool hasLat() => _lat != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  bool hasLng() => _lng != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "userRatingCount" field.
  int? _userRatingCount;
  int get userRatingCount => _userRatingCount ?? 0;
  bool hasUserRatingCount() => _userRatingCount != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "address_ko" field.
  String? _addressKo;
  String get addressKo => _addressKo ?? '';
  bool hasAddressKo() => _addressKo != null;

  // "address_en" field.
  String? _addressEn;
  String get addressEn => _addressEn ?? '';
  bool hasAddressEn() => _addressEn != null;

  // "region_group" field.
  String? _regionGroup;
  String get regionGroup => _regionGroup ?? '';
  bool hasRegionGroup() => _regionGroup != null;

  // "region_detail" field.
  String? _regionDetail;
  String get regionDetail => _regionDetail ?? '';
  bool hasRegionDetail() => _regionDetail != null;

  // "name_ko" field.
  String? _nameKo;
  String get nameKo => _nameKo ?? '';
  bool hasNameKo() => _nameKo != null;

  // "name_en" field.
  String? _nameEn;
  String get nameEn => _nameEn ?? '';
  bool hasNameEn() => _nameEn != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "photo_name" field.
  String? _photoName;
  String get photoName => _photoName ?? '';
  bool hasPhotoName() => _photoName != null;

  // "openinghours" field.
  String? _openinghours;
  String get openinghours => _openinghours ?? '';
  bool hasOpeninghours() => _openinghours != null;

  void _initializeFields() {
    _lat = castToType<double>(snapshotData['lat']);
    _lng = castToType<double>(snapshotData['lng']);
    _rating = castToType<double>(snapshotData['rating']);
    _userRatingCount = castToType<int>(snapshotData['userRatingCount']);
    _uid = snapshotData['uid'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _addressKo = snapshotData['address_ko'] as String?;
    _addressEn = snapshotData['address_en'] as String?;
    _regionGroup = snapshotData['region_group'] as String?;
    _regionDetail = snapshotData['region_detail'] as String?;
    _nameKo = snapshotData['name_ko'] as String?;
    _nameEn = snapshotData['name_en'] as String?;
    _phone = snapshotData['phone'] as String?;
    _website = snapshotData['website'] as String?;
    _photoName = snapshotData['photo_name'] as String?;
    _openinghours = snapshotData['openinghours'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('HalalMap');

  static Stream<HalalMapRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HalalMapRecord.fromSnapshot(s));

  static Future<HalalMapRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HalalMapRecord.fromSnapshot(s));

  static HalalMapRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HalalMapRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HalalMapRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HalalMapRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HalalMapRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HalalMapRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHalalMapRecordData({
  double? lat,
  double? lng,
  double? rating,
  int? userRatingCount,
  String? uid,
  DateTime? createdAt,
  String? status,
  String? addressKo,
  String? addressEn,
  String? regionGroup,
  String? regionDetail,
  String? nameKo,
  String? nameEn,
  String? phone,
  String? website,
  String? photoName,
  String? openinghours,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lat': lat,
      'lng': lng,
      'rating': rating,
      'userRatingCount': userRatingCount,
      'uid': uid,
      'createdAt': createdAt,
      'status': status,
      'address_ko': addressKo,
      'address_en': addressEn,
      'region_group': regionGroup,
      'region_detail': regionDetail,
      'name_ko': nameKo,
      'name_en': nameEn,
      'phone': phone,
      'website': website,
      'photo_name': photoName,
      'openinghours': openinghours,
    }.withoutNulls,
  );

  return firestoreData;
}

class HalalMapRecordDocumentEquality implements Equality<HalalMapRecord> {
  const HalalMapRecordDocumentEquality();

  @override
  bool equals(HalalMapRecord? e1, HalalMapRecord? e2) {
    return e1?.lat == e2?.lat &&
        e1?.lng == e2?.lng &&
        e1?.rating == e2?.rating &&
        e1?.userRatingCount == e2?.userRatingCount &&
        e1?.uid == e2?.uid &&
        e1?.createdAt == e2?.createdAt &&
        e1?.status == e2?.status &&
        e1?.addressKo == e2?.addressKo &&
        e1?.addressEn == e2?.addressEn &&
        e1?.regionGroup == e2?.regionGroup &&
        e1?.regionDetail == e2?.regionDetail &&
        e1?.nameKo == e2?.nameKo &&
        e1?.nameEn == e2?.nameEn &&
        e1?.phone == e2?.phone &&
        e1?.website == e2?.website &&
        e1?.photoName == e2?.photoName &&
        e1?.openinghours == e2?.openinghours;
  }

  @override
  int hash(HalalMapRecord? e) => const ListEquality().hash([
        e?.lat,
        e?.lng,
        e?.rating,
        e?.userRatingCount,
        e?.uid,
        e?.createdAt,
        e?.status,
        e?.addressKo,
        e?.addressEn,
        e?.regionGroup,
        e?.regionDetail,
        e?.nameKo,
        e?.nameEn,
        e?.phone,
        e?.website,
        e?.photoName,
        e?.openinghours
      ]);

  @override
  bool isValidKey(Object? o) => o is HalalMapRecord;
}
