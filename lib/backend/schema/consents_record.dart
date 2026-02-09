import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConsentsRecord extends FirestoreRecord {
  ConsentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "is_terms_agreed" field.
  bool? _isTermsAgreed;
  bool get isTermsAgreed => _isTermsAgreed ?? false;
  bool hasIsTermsAgreed() => _isTermsAgreed != null;

  // "terms_agreed_at" field.
  DateTime? _termsAgreedAt;
  DateTime? get termsAgreedAt => _termsAgreedAt;
  bool hasTermsAgreedAt() => _termsAgreedAt != null;

  // "is_privacy_agreed" field.
  bool? _isPrivacyAgreed;
  bool get isPrivacyAgreed => _isPrivacyAgreed ?? false;
  bool hasIsPrivacyAgreed() => _isPrivacyAgreed != null;

  // "privacy_agreed_at" field.
  DateTime? _privacyAgreedAt;
  DateTime? get privacyAgreedAt => _privacyAgreedAt;
  bool hasPrivacyAgreedAt() => _privacyAgreedAt != null;

  // "is_age_verified" field.
  bool? _isAgeVerified;
  bool get isAgeVerified => _isAgeVerified ?? false;
  bool hasIsAgeVerified() => _isAgeVerified != null;

  // "age_verified_at" field.
  DateTime? _ageVerifiedAt;
  DateTime? get ageVerifiedAt => _ageVerifiedAt;
  bool hasAgeVerifiedAt() => _ageVerifiedAt != null;

  // "is_marketing_sms_agreed" field.
  bool? _isMarketingSmsAgreed;
  bool get isMarketingSmsAgreed => _isMarketingSmsAgreed ?? false;
  bool hasIsMarketingSmsAgreed() => _isMarketingSmsAgreed != null;

  // "is_marketing_email_agreed" field.
  bool? _isMarketingEmailAgreed;
  bool get isMarketingEmailAgreed => _isMarketingEmailAgreed ?? false;
  bool hasIsMarketingEmailAgreed() => _isMarketingEmailAgreed != null;

  // "is_marketing_push_agreed" field.
  bool? _isMarketingPushAgreed;
  bool get isMarketingPushAgreed => _isMarketingPushAgreed ?? false;
  bool hasIsMarketingPushAgreed() => _isMarketingPushAgreed != null;

  // "is_marketing_email_agreed_at" field.
  DateTime? _isMarketingEmailAgreedAt;
  DateTime? get isMarketingEmailAgreedAt => _isMarketingEmailAgreedAt;
  bool hasIsMarketingEmailAgreedAt() => _isMarketingEmailAgreedAt != null;

  // "is_marketing_sms_agreed_at" field.
  DateTime? _isMarketingSmsAgreedAt;
  DateTime? get isMarketingSmsAgreedAt => _isMarketingSmsAgreedAt;
  bool hasIsMarketingSmsAgreedAt() => _isMarketingSmsAgreedAt != null;

  // "is_marketing_push_agreed_at" field.
  DateTime? _isMarketingPushAgreedAt;
  DateTime? get isMarketingPushAgreedAt => _isMarketingPushAgreedAt;
  bool hasIsMarketingPushAgreedAt() => _isMarketingPushAgreedAt != null;

  // "docID" field.
  String? _docID;
  String get docID => _docID ?? '';
  bool hasDocID() => _docID != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isTermsAgreed = snapshotData['is_terms_agreed'] as bool?;
    _termsAgreedAt = snapshotData['terms_agreed_at'] as DateTime?;
    _isPrivacyAgreed = snapshotData['is_privacy_agreed'] as bool?;
    _privacyAgreedAt = snapshotData['privacy_agreed_at'] as DateTime?;
    _isAgeVerified = snapshotData['is_age_verified'] as bool?;
    _ageVerifiedAt = snapshotData['age_verified_at'] as DateTime?;
    _isMarketingSmsAgreed = snapshotData['is_marketing_sms_agreed'] as bool?;
    _isMarketingEmailAgreed =
        snapshotData['is_marketing_email_agreed'] as bool?;
    _isMarketingPushAgreed = snapshotData['is_marketing_push_agreed'] as bool?;
    _isMarketingEmailAgreedAt =
        snapshotData['is_marketing_email_agreed_at'] as DateTime?;
    _isMarketingSmsAgreedAt =
        snapshotData['is_marketing_sms_agreed_at'] as DateTime?;
    _isMarketingPushAgreedAt =
        snapshotData['is_marketing_push_agreed_at'] as DateTime?;
    _docID = snapshotData['docID'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('consents')
          : FirebaseFirestore.instance.collectionGroup('consents');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('consents').doc(id);

  static Stream<ConsentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConsentsRecord.fromSnapshot(s));

  static Future<ConsentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConsentsRecord.fromSnapshot(s));

  static ConsentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConsentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConsentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConsentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConsentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConsentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConsentsRecordData({
  bool? isTermsAgreed,
  DateTime? termsAgreedAt,
  bool? isPrivacyAgreed,
  DateTime? privacyAgreedAt,
  bool? isAgeVerified,
  DateTime? ageVerifiedAt,
  bool? isMarketingSmsAgreed,
  bool? isMarketingEmailAgreed,
  bool? isMarketingPushAgreed,
  DateTime? isMarketingEmailAgreedAt,
  DateTime? isMarketingSmsAgreedAt,
  DateTime? isMarketingPushAgreedAt,
  String? docID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'is_terms_agreed': isTermsAgreed,
      'terms_agreed_at': termsAgreedAt,
      'is_privacy_agreed': isPrivacyAgreed,
      'privacy_agreed_at': privacyAgreedAt,
      'is_age_verified': isAgeVerified,
      'age_verified_at': ageVerifiedAt,
      'is_marketing_sms_agreed': isMarketingSmsAgreed,
      'is_marketing_email_agreed': isMarketingEmailAgreed,
      'is_marketing_push_agreed': isMarketingPushAgreed,
      'is_marketing_email_agreed_at': isMarketingEmailAgreedAt,
      'is_marketing_sms_agreed_at': isMarketingSmsAgreedAt,
      'is_marketing_push_agreed_at': isMarketingPushAgreedAt,
      'docID': docID,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConsentsRecordDocumentEquality implements Equality<ConsentsRecord> {
  const ConsentsRecordDocumentEquality();

  @override
  bool equals(ConsentsRecord? e1, ConsentsRecord? e2) {
    return e1?.isTermsAgreed == e2?.isTermsAgreed &&
        e1?.termsAgreedAt == e2?.termsAgreedAt &&
        e1?.isPrivacyAgreed == e2?.isPrivacyAgreed &&
        e1?.privacyAgreedAt == e2?.privacyAgreedAt &&
        e1?.isAgeVerified == e2?.isAgeVerified &&
        e1?.ageVerifiedAt == e2?.ageVerifiedAt &&
        e1?.isMarketingSmsAgreed == e2?.isMarketingSmsAgreed &&
        e1?.isMarketingEmailAgreed == e2?.isMarketingEmailAgreed &&
        e1?.isMarketingPushAgreed == e2?.isMarketingPushAgreed &&
        e1?.isMarketingEmailAgreedAt == e2?.isMarketingEmailAgreedAt &&
        e1?.isMarketingSmsAgreedAt == e2?.isMarketingSmsAgreedAt &&
        e1?.isMarketingPushAgreedAt == e2?.isMarketingPushAgreedAt &&
        e1?.docID == e2?.docID;
  }

  @override
  int hash(ConsentsRecord? e) => const ListEquality().hash([
        e?.isTermsAgreed,
        e?.termsAgreedAt,
        e?.isPrivacyAgreed,
        e?.privacyAgreedAt,
        e?.isAgeVerified,
        e?.ageVerifiedAt,
        e?.isMarketingSmsAgreed,
        e?.isMarketingEmailAgreed,
        e?.isMarketingPushAgreed,
        e?.isMarketingEmailAgreedAt,
        e?.isMarketingSmsAgreedAt,
        e?.isMarketingPushAgreedAt,
        e?.docID
      ]);

  @override
  bool isValidKey(Object? o) => o is ConsentsRecord;
}
