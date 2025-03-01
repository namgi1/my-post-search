import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "brandName" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  bool hasBrandName() => _brandName != null;

  // "halalCertUrl" field.
  String? _halalCertUrl;
  String get halalCertUrl => _halalCertUrl ?? '';
  bool hasHalalCertUrl() => _halalCertUrl != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  bool hasStock() => _stock != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "descriptionImageUrls" field.
  List<String>? _descriptionImageUrls;
  List<String> get descriptionImageUrls => _descriptionImageUrls ?? const [];
  bool hasDescriptionImageUrls() => _descriptionImageUrls != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "discountedPrice" field.
  double? _discountedPrice;
  double get discountedPrice => _discountedPrice ?? 0.0;
  bool hasDiscountedPrice() => _discountedPrice != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  bool hasDiscount() => _discount != null;

  // "product_Id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "images" field.
  String? _images;
  String get images => _images ?? '';
  bool hasImages() => _images != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _productName = snapshotData['productName'] as String?;
    _brandName = snapshotData['brandName'] as String?;
    _halalCertUrl = snapshotData['halalCertUrl'] as String?;
    _stock = castToType<int>(snapshotData['stock']);
    _description = snapshotData['description'] as String?;
    _descriptionImageUrls = getDataList(snapshotData['descriptionImageUrls']);
    _price = castToType<double>(snapshotData['price']);
    _discountedPrice = castToType<double>(snapshotData['discountedPrice']);
    _discount = castToType<double>(snapshotData['discount']);
    _productId = snapshotData['product_Id'] as String?;
    _images = snapshotData['images'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  String? category,
  String? productName,
  String? brandName,
  String? halalCertUrl,
  int? stock,
  String? description,
  double? price,
  double? discountedPrice,
  double? discount,
  String? productId,
  String? images,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'productName': productName,
      'brandName': brandName,
      'halalCertUrl': halalCertUrl,
      'stock': stock,
      'description': description,
      'price': price,
      'discountedPrice': discountedPrice,
      'discount': discount,
      'product_Id': productId,
      'images': images,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    const listEquality = ListEquality();
    return e1?.category == e2?.category &&
        e1?.productName == e2?.productName &&
        e1?.brandName == e2?.brandName &&
        e1?.halalCertUrl == e2?.halalCertUrl &&
        e1?.stock == e2?.stock &&
        e1?.description == e2?.description &&
        listEquality.equals(
            e1?.descriptionImageUrls, e2?.descriptionImageUrls) &&
        e1?.price == e2?.price &&
        e1?.discountedPrice == e2?.discountedPrice &&
        e1?.discount == e2?.discount &&
        e1?.productId == e2?.productId &&
        e1?.images == e2?.images;
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.category,
        e?.productName,
        e?.brandName,
        e?.halalCertUrl,
        e?.stock,
        e?.description,
        e?.descriptionImageUrls,
        e?.price,
        e?.discountedPrice,
        e?.discount,
        e?.productId,
        e?.images
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
