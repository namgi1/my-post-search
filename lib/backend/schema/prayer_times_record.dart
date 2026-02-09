import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrayerTimesRecord extends FirestoreRecord {
  PrayerTimesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timezone" field.
  String? _timezone;
  String get timezone => _timezone ?? '';
  bool hasTimezone() => _timezone != null;

  // "method" field.
  String? _method;
  String get method => _method ?? '';
  bool hasMethod() => _method != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "fajr" field.
  String? _fajr;
  String get fajr => _fajr ?? '';
  bool hasFajr() => _fajr != null;

  // "sunrise" field.
  String? _sunrise;
  String get sunrise => _sunrise ?? '';
  bool hasSunrise() => _sunrise != null;

  // "dhuhr" field.
  String? _dhuhr;
  String get dhuhr => _dhuhr ?? '';
  bool hasDhuhr() => _dhuhr != null;

  // "asr" field.
  String? _asr;
  String get asr => _asr ?? '';
  bool hasAsr() => _asr != null;

  // "maghrib" field.
  String? _maghrib;
  String get maghrib => _maghrib ?? '';
  bool hasMaghrib() => _maghrib != null;

  // "isha" field.
  String? _isha;
  String get isha => _isha ?? '';
  bool hasIsha() => _isha != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timezone = snapshotData['timezone'] as String?;
    _method = snapshotData['method'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _fajr = snapshotData['fajr'] as String?;
    _sunrise = snapshotData['sunrise'] as String?;
    _dhuhr = snapshotData['dhuhr'] as String?;
    _asr = snapshotData['asr'] as String?;
    _maghrib = snapshotData['maghrib'] as String?;
    _isha = snapshotData['isha'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('prayer_times')
          : FirebaseFirestore.instance.collectionGroup('prayer_times');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('prayer_times').doc(id);

  static Stream<PrayerTimesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrayerTimesRecord.fromSnapshot(s));

  static Future<PrayerTimesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PrayerTimesRecord.fromSnapshot(s));

  static PrayerTimesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrayerTimesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrayerTimesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrayerTimesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrayerTimesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrayerTimesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrayerTimesRecordData({
  String? timezone,
  String? method,
  LatLng? location,
  String? fajr,
  String? sunrise,
  String? dhuhr,
  String? asr,
  String? maghrib,
  String? isha,
  DateTime? createdAt,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timezone': timezone,
      'method': method,
      'location': location,
      'fajr': fajr,
      'sunrise': sunrise,
      'dhuhr': dhuhr,
      'asr': asr,
      'maghrib': maghrib,
      'isha': isha,
      'createdAt': createdAt,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrayerTimesRecordDocumentEquality implements Equality<PrayerTimesRecord> {
  const PrayerTimesRecordDocumentEquality();

  @override
  bool equals(PrayerTimesRecord? e1, PrayerTimesRecord? e2) {
    return e1?.timezone == e2?.timezone &&
        e1?.method == e2?.method &&
        e1?.location == e2?.location &&
        e1?.fajr == e2?.fajr &&
        e1?.sunrise == e2?.sunrise &&
        e1?.dhuhr == e2?.dhuhr &&
        e1?.asr == e2?.asr &&
        e1?.maghrib == e2?.maghrib &&
        e1?.isha == e2?.isha &&
        e1?.createdAt == e2?.createdAt &&
        e1?.date == e2?.date;
  }

  @override
  int hash(PrayerTimesRecord? e) => const ListEquality().hash([
        e?.timezone,
        e?.method,
        e?.location,
        e?.fajr,
        e?.sunrise,
        e?.dhuhr,
        e?.asr,
        e?.maghrib,
        e?.isha,
        e?.createdAt,
        e?.date
      ]);

  @override
  bool isValidKey(Object? o) => o is PrayerTimesRecord;
}
