import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "brandName" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  bool hasBrandName() => _brandName != null;

  // "MainCategory" field.
  String? _mainCategory;
  String get mainCategory => _mainCategory ?? '';
  bool hasMainCategory() => _mainCategory != null;

  // "SubCategory" field.
  String? _subCategory;
  String get subCategory => _subCategory ?? '';
  bool hasSubCategory() => _subCategory != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  bool hasStock() => _stock != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "origin" field.
  String? _origin;
  String get origin => _origin ?? '';
  bool hasOrigin() => _origin != null;

  // "ingredients" field.
  String? _ingredients;
  String get ingredients => _ingredients ?? '';
  bool hasIngredients() => _ingredients != null;

  // "shippingInfo" field.
  String? _shippingInfo;
  String get shippingInfo => _shippingInfo ?? '';
  bool hasShippingInfo() => _shippingInfo != null;

  // "shippingInfo_detail" field.
  String? _shippingInfoDetail;
  String get shippingInfoDetail => _shippingInfoDetail ?? '';
  bool hasShippingInfoDetail() => _shippingInfoDetail != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "Main_image" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  bool hasMainImage() => _mainImage != null;

  // "description_image" field.
  List<String>? _descriptionImage;
  List<String> get descriptionImage => _descriptionImage ?? const [];
  bool hasDescriptionImage() => _descriptionImage != null;

  // "halalCert_image" field.
  String? _halalCertImage;
  String get halalCertImage => _halalCertImage ?? '';
  bool hasHalalCertImage() => _halalCertImage != null;

  // "image" field.
  List<String>? _image;
  List<String> get image => _image ?? const [];
  bool hasImage() => _image != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "discount" field.
  int? _discount;
  int get discount => _discount ?? 0;
  bool hasDiscount() => _discount != null;

  // "discounted_Rate" field.
  int? _discountedRate;
  int get discountedRate => _discountedRate ?? 0;
  bool hasDiscountedRate() => _discountedRate != null;

  // "discountedPrice" field.
  int? _discountedPrice;
  int get discountedPrice => _discountedPrice ?? 0;
  bool hasDiscountedPrice() => _discountedPrice != null;

  // "isRecommended" field.
  bool? _isRecommended;
  bool get isRecommended => _isRecommended ?? false;
  bool hasIsRecommended() => _isRecommended != null;

  // "avgRating" field.
  double? _avgRating;
  double get avgRating => _avgRating ?? 0.0;
  bool hasAvgRating() => _avgRating != null;

  // "reviewCount" field.
  int? _reviewCount;
  int get reviewCount => _reviewCount ?? 0;
  bool hasReviewCount() => _reviewCount != null;

  // "sellerId" field.
  String? _sellerId;
  String get sellerId => _sellerId ?? '';
  bool hasSellerId() => _sellerId != null;

  // "sales_count" field.
  int? _salesCount;
  int get salesCount => _salesCount ?? 0;
  bool hasSalesCount() => _salesCount != null;

  // "halalCert_body" field.
  String? _halalCertBody;
  String get halalCertBody => _halalCertBody ?? '';
  bool hasHalalCertBody() => _halalCertBody != null;

  // "halalCert_Number" field.
  String? _halalCertNumber;
  String get halalCertNumber => _halalCertNumber ?? '';
  bool hasHalalCertNumber() => _halalCertNumber != null;

  // "halalCert_IssueDate" field.
  DateTime? _halalCertIssueDate;
  DateTime? get halalCertIssueDate => _halalCertIssueDate;
  bool hasHalalCertIssueDate() => _halalCertIssueDate != null;

  // "halalCert_ExpiryDate" field.
  DateTime? _halalCertExpiryDate;
  DateTime? get halalCertExpiryDate => _halalCertExpiryDate;
  bool hasHalalCertExpiryDate() => _halalCertExpiryDate != null;

  // "halalCert_TF" field.
  bool? _halalCertTF;
  bool get halalCertTF => _halalCertTF ?? false;
  bool hasHalalCertTF() => _halalCertTF != null;

  void _initializeFields() {
    _productName = snapshotData['productName'] as String?;
    _brandName = snapshotData['brandName'] as String?;
    _mainCategory = snapshotData['MainCategory'] as String?;
    _subCategory = snapshotData['SubCategory'] as String?;
    _tags = getDataList(snapshotData['tags']);
    _stock = castToType<int>(snapshotData['stock']);
    _description = snapshotData['description'] as String?;
    _origin = snapshotData['origin'] as String?;
    _ingredients = snapshotData['ingredients'] as String?;
    _shippingInfo = snapshotData['shippingInfo'] as String?;
    _shippingInfoDetail = snapshotData['shippingInfo_detail'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _mainImage = snapshotData['Main_image'] as String?;
    _descriptionImage = getDataList(snapshotData['description_image']);
    _halalCertImage = snapshotData['halalCert_image'] as String?;
    _image = getDataList(snapshotData['image']);
    _price = castToType<int>(snapshotData['price']);
    _discount = castToType<int>(snapshotData['discount']);
    _discountedRate = castToType<int>(snapshotData['discounted_Rate']);
    _discountedPrice = castToType<int>(snapshotData['discountedPrice']);
    _isRecommended = snapshotData['isRecommended'] as bool?;
    _avgRating = castToType<double>(snapshotData['avgRating']);
    _reviewCount = castToType<int>(snapshotData['reviewCount']);
    _sellerId = snapshotData['sellerId'] as String?;
    _salesCount = castToType<int>(snapshotData['sales_count']);
    _halalCertBody = snapshotData['halalCert_body'] as String?;
    _halalCertNumber = snapshotData['halalCert_Number'] as String?;
    _halalCertIssueDate = snapshotData['halalCert_IssueDate'] as DateTime?;
    _halalCertExpiryDate = snapshotData['halalCert_ExpiryDate'] as DateTime?;
    _halalCertTF = snapshotData['halalCert_TF'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  static ProductsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProductsRecord.getDocumentFromData(
        {
          'productName': snapshot.data['productName'],
          'brandName': snapshot.data['brandName'],
          'MainCategory': snapshot.data['MainCategory'],
          'SubCategory': snapshot.data['SubCategory'],
          'tags': safeGet(
            () => snapshot.data['tags'].toList(),
          ),
          'stock': convertAlgoliaParam(
            snapshot.data['stock'],
            ParamType.int,
            false,
          ),
          'description': snapshot.data['description'],
          'origin': snapshot.data['origin'],
          'ingredients': snapshot.data['ingredients'],
          'shippingInfo': snapshot.data['shippingInfo'],
          'shippingInfo_detail': snapshot.data['shippingInfo_detail'],
          'createdAt': convertAlgoliaParam(
            snapshot.data['createdAt'],
            ParamType.DateTime,
            false,
          ),
          'Main_image': snapshot.data['Main_image'],
          'description_image': safeGet(
            () => snapshot.data['description_image'].toList(),
          ),
          'halalCert_image': snapshot.data['halalCert_image'],
          'image': safeGet(
            () => snapshot.data['image'].toList(),
          ),
          'price': convertAlgoliaParam(
            snapshot.data['price'],
            ParamType.int,
            false,
          ),
          'discount': convertAlgoliaParam(
            snapshot.data['discount'],
            ParamType.int,
            false,
          ),
          'discounted_Rate': convertAlgoliaParam(
            snapshot.data['discounted_Rate'],
            ParamType.int,
            false,
          ),
          'discountedPrice': convertAlgoliaParam(
            snapshot.data['discountedPrice'],
            ParamType.int,
            false,
          ),
          'isRecommended': snapshot.data['isRecommended'],
          'avgRating': convertAlgoliaParam(
            snapshot.data['avgRating'],
            ParamType.double,
            false,
          ),
          'reviewCount': convertAlgoliaParam(
            snapshot.data['reviewCount'],
            ParamType.int,
            false,
          ),
          'sellerId': snapshot.data['sellerId'],
          'sales_count': convertAlgoliaParam(
            snapshot.data['sales_count'],
            ParamType.int,
            false,
          ),
          'halalCert_body': snapshot.data['halalCert_body'],
          'halalCert_Number': snapshot.data['halalCert_Number'],
          'halalCert_IssueDate': convertAlgoliaParam(
            snapshot.data['halalCert_IssueDate'],
            ParamType.DateTime,
            false,
          ),
          'halalCert_ExpiryDate': convertAlgoliaParam(
            snapshot.data['halalCert_ExpiryDate'],
            ParamType.DateTime,
            false,
          ),
          'halalCert_TF': snapshot.data['halalCert_TF'],
        },
        ProductsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProductsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'products',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? productName,
  String? brandName,
  String? mainCategory,
  String? subCategory,
  int? stock,
  String? description,
  String? origin,
  String? ingredients,
  String? shippingInfo,
  String? shippingInfoDetail,
  DateTime? createdAt,
  String? mainImage,
  String? halalCertImage,
  int? price,
  int? discount,
  int? discountedRate,
  int? discountedPrice,
  bool? isRecommended,
  double? avgRating,
  int? reviewCount,
  String? sellerId,
  int? salesCount,
  String? halalCertBody,
  String? halalCertNumber,
  DateTime? halalCertIssueDate,
  DateTime? halalCertExpiryDate,
  bool? halalCertTF,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'productName': productName,
      'brandName': brandName,
      'MainCategory': mainCategory,
      'SubCategory': subCategory,
      'stock': stock,
      'description': description,
      'origin': origin,
      'ingredients': ingredients,
      'shippingInfo': shippingInfo,
      'shippingInfo_detail': shippingInfoDetail,
      'createdAt': createdAt,
      'Main_image': mainImage,
      'halalCert_image': halalCertImage,
      'price': price,
      'discount': discount,
      'discounted_Rate': discountedRate,
      'discountedPrice': discountedPrice,
      'isRecommended': isRecommended,
      'avgRating': avgRating,
      'reviewCount': reviewCount,
      'sellerId': sellerId,
      'sales_count': salesCount,
      'halalCert_body': halalCertBody,
      'halalCert_Number': halalCertNumber,
      'halalCert_IssueDate': halalCertIssueDate,
      'halalCert_ExpiryDate': halalCertExpiryDate,
      'halalCert_TF': halalCertTF,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.productName == e2?.productName &&
        e1?.brandName == e2?.brandName &&
        e1?.mainCategory == e2?.mainCategory &&
        e1?.subCategory == e2?.subCategory &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.stock == e2?.stock &&
        e1?.description == e2?.description &&
        e1?.origin == e2?.origin &&
        e1?.ingredients == e2?.ingredients &&
        e1?.shippingInfo == e2?.shippingInfo &&
        e1?.shippingInfoDetail == e2?.shippingInfoDetail &&
        e1?.createdAt == e2?.createdAt &&
        e1?.mainImage == e2?.mainImage &&
        listEquality.equals(e1?.descriptionImage, e2?.descriptionImage) &&
        e1?.halalCertImage == e2?.halalCertImage &&
        listEquality.equals(e1?.image, e2?.image) &&
        e1?.price == e2?.price &&
        e1?.discount == e2?.discount &&
        e1?.discountedRate == e2?.discountedRate &&
        e1?.discountedPrice == e2?.discountedPrice &&
        e1?.isRecommended == e2?.isRecommended &&
        e1?.avgRating == e2?.avgRating &&
        e1?.reviewCount == e2?.reviewCount &&
        e1?.sellerId == e2?.sellerId &&
        e1?.salesCount == e2?.salesCount &&
        e1?.halalCertBody == e2?.halalCertBody &&
        e1?.halalCertNumber == e2?.halalCertNumber &&
        e1?.halalCertIssueDate == e2?.halalCertIssueDate &&
        e1?.halalCertExpiryDate == e2?.halalCertExpiryDate &&
        e1?.halalCertTF == e2?.halalCertTF;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.productName,
        e?.brandName,
        e?.mainCategory,
        e?.subCategory,
        e?.tags,
        e?.stock,
        e?.description,
        e?.origin,
        e?.ingredients,
        e?.shippingInfo,
        e?.shippingInfoDetail,
        e?.createdAt,
        e?.mainImage,
        e?.descriptionImage,
        e?.halalCertImage,
        e?.image,
        e?.price,
        e?.discount,
        e?.discountedRate,
        e?.discountedPrice,
        e?.isRecommended,
        e?.avgRating,
        e?.reviewCount,
        e?.sellerId,
        e?.salesCount,
        e?.halalCertBody,
        e?.halalCertNumber,
        e?.halalCertIssueDate,
        e?.halalCertExpiryDate,
        e?.halalCertTF
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
