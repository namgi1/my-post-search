// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceItemStruct extends FFFirebaseStruct {
  PlaceItemStruct({
    String? name,
    double? lat,
    double? lng,
    String? address,
    double? rating,
    int? ratingCount,
    List<String>? photo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _lat = lat,
        _lng = lng,
        _address = address,
        _rating = rating,
        _ratingCount = ratingCount,
        _photo = photo,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;

  void incrementLat(double amount) => lat = lat + amount;

  bool hasLat() => _lat != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  set lng(double? val) => _lng = val;

  void incrementLng(double amount) => lng = lng + amount;

  bool hasLng() => _lng != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  set rating(double? val) => _rating = val;

  void incrementRating(double amount) => rating = rating + amount;

  bool hasRating() => _rating != null;

  // "ratingCount" field.
  int? _ratingCount;
  int get ratingCount => _ratingCount ?? 0;
  set ratingCount(int? val) => _ratingCount = val;

  void incrementRatingCount(int amount) => ratingCount = ratingCount + amount;

  bool hasRatingCount() => _ratingCount != null;

  // "photo" field.
  List<String>? _photo;
  List<String> get photo => _photo ?? const [];
  set photo(List<String>? val) => _photo = val;

  void updatePhoto(Function(List<String>) updateFn) {
    updateFn(_photo ??= []);
  }

  bool hasPhoto() => _photo != null;

  static PlaceItemStruct fromMap(Map<String, dynamic> data) => PlaceItemStruct(
        name: data['name'] as String?,
        lat: castToType<double>(data['lat']),
        lng: castToType<double>(data['lng']),
        address: data['address'] as String?,
        rating: castToType<double>(data['rating']),
        ratingCount: castToType<int>(data['ratingCount']),
        photo: getDataList(data['photo']),
      );

  static PlaceItemStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaceItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'lat': _lat,
        'lng': _lng,
        'address': _address,
        'rating': _rating,
        'ratingCount': _ratingCount,
        'photo': _photo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.double,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.double,
        ),
        'ratingCount': serializeParam(
          _ratingCount,
          ParamType.int,
        ),
        'photo': serializeParam(
          _photo,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static PlaceItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaceItemStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.double,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.double,
          false,
        ),
        ratingCount: deserializeParam(
          data['ratingCount'],
          ParamType.int,
          false,
        ),
        photo: deserializeParam<String>(
          data['photo'],
          ParamType.String,
          true,
        ),
      );

  static PlaceItemStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PlaceItemStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        lat: convertAlgoliaParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lng: convertAlgoliaParam(
          data['lng'],
          ParamType.double,
          false,
        ),
        address: convertAlgoliaParam(
          data['address'],
          ParamType.String,
          false,
        ),
        rating: convertAlgoliaParam(
          data['rating'],
          ParamType.double,
          false,
        ),
        ratingCount: convertAlgoliaParam(
          data['ratingCount'],
          ParamType.int,
          false,
        ),
        photo: convertAlgoliaParam<String>(
          data['photo'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PlaceItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlaceItemStruct &&
        name == other.name &&
        lat == other.lat &&
        lng == other.lng &&
        address == other.address &&
        rating == other.rating &&
        ratingCount == other.ratingCount &&
        listEquality.equals(photo, other.photo);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, lat, lng, address, rating, ratingCount, photo]);
}

PlaceItemStruct createPlaceItemStruct({
  String? name,
  double? lat,
  double? lng,
  String? address,
  double? rating,
  int? ratingCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlaceItemStruct(
      name: name,
      lat: lat,
      lng: lng,
      address: address,
      rating: rating,
      ratingCount: ratingCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlaceItemStruct? updatePlaceItemStruct(
  PlaceItemStruct? placeItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placeItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlaceItemStructData(
  Map<String, dynamic> firestoreData,
  PlaceItemStruct? placeItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placeItem == null) {
    return;
  }
  if (placeItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && placeItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placeItemData = getPlaceItemFirestoreData(placeItem, forFieldValue);
  final nestedData = placeItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = placeItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlaceItemFirestoreData(
  PlaceItemStruct? placeItem, [
  bool forFieldValue = false,
]) {
  if (placeItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placeItem.toMap());

  // Add any Firestore field values
  placeItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlaceItemListFirestoreData(
  List<PlaceItemStruct>? placeItems,
) =>
    placeItems?.map((e) => getPlaceItemFirestoreData(e, true)).toList() ?? [];
