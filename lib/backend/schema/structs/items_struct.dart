// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ItemsStruct extends FFFirebaseStruct {
  ItemsStruct({
    String? productName,
    int? quantity,
    int? discountedPrice,
    String? productId,
    String? mainImage,
    String? sellerId,
    String? deliveryNumber,
    String? deliveryCompany,
    String? deliveryCode,
    String? deliveryStatus,
    String? reviewId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productName = productName,
        _quantity = quantity,
        _discountedPrice = discountedPrice,
        _productId = productId,
        _mainImage = mainImage,
        _sellerId = sellerId,
        _deliveryNumber = deliveryNumber,
        _deliveryCompany = deliveryCompany,
        _deliveryCode = deliveryCode,
        _deliveryStatus = deliveryStatus,
        _reviewId = reviewId,
        super(firestoreUtilData);

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  set productName(String? val) => _productName = val;

  bool hasProductName() => _productName != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "discounted_price" field.
  int? _discountedPrice;
  int get discountedPrice => _discountedPrice ?? 0;
  set discountedPrice(int? val) => _discountedPrice = val;

  void incrementDiscountedPrice(int amount) =>
      discountedPrice = discountedPrice + amount;

  bool hasDiscountedPrice() => _discountedPrice != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "Main_image" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  set mainImage(String? val) => _mainImage = val;

  bool hasMainImage() => _mainImage != null;

  // "sellerId" field.
  String? _sellerId;
  String get sellerId => _sellerId ?? '';
  set sellerId(String? val) => _sellerId = val;

  bool hasSellerId() => _sellerId != null;

  // "delivery_number" field.
  String? _deliveryNumber;
  String get deliveryNumber => _deliveryNumber ?? '';
  set deliveryNumber(String? val) => _deliveryNumber = val;

  bool hasDeliveryNumber() => _deliveryNumber != null;

  // "delivery_company" field.
  String? _deliveryCompany;
  String get deliveryCompany => _deliveryCompany ?? '';
  set deliveryCompany(String? val) => _deliveryCompany = val;

  bool hasDeliveryCompany() => _deliveryCompany != null;

  // "delivery_code" field.
  String? _deliveryCode;
  String get deliveryCode => _deliveryCode ?? '';
  set deliveryCode(String? val) => _deliveryCode = val;

  bool hasDeliveryCode() => _deliveryCode != null;

  // "delivery_status" field.
  String? _deliveryStatus;
  String get deliveryStatus => _deliveryStatus ?? '';
  set deliveryStatus(String? val) => _deliveryStatus = val;

  bool hasDeliveryStatus() => _deliveryStatus != null;

  // "reviewId" field.
  String? _reviewId;
  String get reviewId => _reviewId ?? '';
  set reviewId(String? val) => _reviewId = val;

  bool hasReviewId() => _reviewId != null;

  static ItemsStruct fromMap(Map<String, dynamic> data) => ItemsStruct(
        productName: data['product_name'] as String?,
        quantity: castToType<int>(data['quantity']),
        discountedPrice: castToType<int>(data['discounted_price']),
        productId: data['productId'] as String?,
        mainImage: data['Main_image'] as String?,
        sellerId: data['sellerId'] as String?,
        deliveryNumber: data['delivery_number'] as String?,
        deliveryCompany: data['delivery_company'] as String?,
        deliveryCode: data['delivery_code'] as String?,
        deliveryStatus: data['delivery_status'] as String?,
        reviewId: data['reviewId'] as String?,
      );

  static ItemsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'product_name': _productName,
        'quantity': _quantity,
        'discounted_price': _discountedPrice,
        'productId': _productId,
        'Main_image': _mainImage,
        'sellerId': _sellerId,
        'delivery_number': _deliveryNumber,
        'delivery_company': _deliveryCompany,
        'delivery_code': _deliveryCode,
        'delivery_status': _deliveryStatus,
        'reviewId': _reviewId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_name': serializeParam(
          _productName,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'discounted_price': serializeParam(
          _discountedPrice,
          ParamType.int,
        ),
        'productId': serializeParam(
          _productId,
          ParamType.String,
        ),
        'Main_image': serializeParam(
          _mainImage,
          ParamType.String,
        ),
        'sellerId': serializeParam(
          _sellerId,
          ParamType.String,
        ),
        'delivery_number': serializeParam(
          _deliveryNumber,
          ParamType.String,
        ),
        'delivery_company': serializeParam(
          _deliveryCompany,
          ParamType.String,
        ),
        'delivery_code': serializeParam(
          _deliveryCode,
          ParamType.String,
        ),
        'delivery_status': serializeParam(
          _deliveryStatus,
          ParamType.String,
        ),
        'reviewId': serializeParam(
          _reviewId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemsStruct(
        productName: deserializeParam(
          data['product_name'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        discountedPrice: deserializeParam(
          data['discounted_price'],
          ParamType.int,
          false,
        ),
        productId: deserializeParam(
          data['productId'],
          ParamType.String,
          false,
        ),
        mainImage: deserializeParam(
          data['Main_image'],
          ParamType.String,
          false,
        ),
        sellerId: deserializeParam(
          data['sellerId'],
          ParamType.String,
          false,
        ),
        deliveryNumber: deserializeParam(
          data['delivery_number'],
          ParamType.String,
          false,
        ),
        deliveryCompany: deserializeParam(
          data['delivery_company'],
          ParamType.String,
          false,
        ),
        deliveryCode: deserializeParam(
          data['delivery_code'],
          ParamType.String,
          false,
        ),
        deliveryStatus: deserializeParam(
          data['delivery_status'],
          ParamType.String,
          false,
        ),
        reviewId: deserializeParam(
          data['reviewId'],
          ParamType.String,
          false,
        ),
      );

  static ItemsStruct fromAlgoliaData(Map<String, dynamic> data) => ItemsStruct(
        productName: convertAlgoliaParam(
          data['product_name'],
          ParamType.String,
          false,
        ),
        quantity: convertAlgoliaParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        discountedPrice: convertAlgoliaParam(
          data['discounted_price'],
          ParamType.int,
          false,
        ),
        productId: convertAlgoliaParam(
          data['productId'],
          ParamType.String,
          false,
        ),
        mainImage: convertAlgoliaParam(
          data['Main_image'],
          ParamType.String,
          false,
        ),
        sellerId: convertAlgoliaParam(
          data['sellerId'],
          ParamType.String,
          false,
        ),
        deliveryNumber: convertAlgoliaParam(
          data['delivery_number'],
          ParamType.String,
          false,
        ),
        deliveryCompany: convertAlgoliaParam(
          data['delivery_company'],
          ParamType.String,
          false,
        ),
        deliveryCode: convertAlgoliaParam(
          data['delivery_code'],
          ParamType.String,
          false,
        ),
        deliveryStatus: convertAlgoliaParam(
          data['delivery_status'],
          ParamType.String,
          false,
        ),
        reviewId: convertAlgoliaParam(
          data['reviewId'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemsStruct &&
        productName == other.productName &&
        quantity == other.quantity &&
        discountedPrice == other.discountedPrice &&
        productId == other.productId &&
        mainImage == other.mainImage &&
        sellerId == other.sellerId &&
        deliveryNumber == other.deliveryNumber &&
        deliveryCompany == other.deliveryCompany &&
        deliveryCode == other.deliveryCode &&
        deliveryStatus == other.deliveryStatus &&
        reviewId == other.reviewId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        productName,
        quantity,
        discountedPrice,
        productId,
        mainImage,
        sellerId,
        deliveryNumber,
        deliveryCompany,
        deliveryCode,
        deliveryStatus,
        reviewId
      ]);
}

ItemsStruct createItemsStruct({
  String? productName,
  int? quantity,
  int? discountedPrice,
  String? productId,
  String? mainImage,
  String? sellerId,
  String? deliveryNumber,
  String? deliveryCompany,
  String? deliveryCode,
  String? deliveryStatus,
  String? reviewId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemsStruct(
      productName: productName,
      quantity: quantity,
      discountedPrice: discountedPrice,
      productId: productId,
      mainImage: mainImage,
      sellerId: sellerId,
      deliveryNumber: deliveryNumber,
      deliveryCompany: deliveryCompany,
      deliveryCode: deliveryCode,
      deliveryStatus: deliveryStatus,
      reviewId: reviewId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemsStruct? updateItemsStruct(
  ItemsStruct? items, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    items
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemsStructData(
  Map<String, dynamic> firestoreData,
  ItemsStruct? items,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (items == null) {
    return;
  }
  if (items.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && items.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemsData = getItemsFirestoreData(items, forFieldValue);
  final nestedData = itemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = items.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemsFirestoreData(
  ItemsStruct? items, [
  bool forFieldValue = false,
]) {
  if (items == null) {
    return {};
  }
  final firestoreData = mapToFirestore(items.toMap());

  // Add any Firestore field values
  items.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemsListFirestoreData(
  List<ItemsStruct>? itemss,
) =>
    itemss?.map((e) => getItemsFirestoreData(e, true)).toList() ?? [];
