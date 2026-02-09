import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemsRecord extends FirestoreRecord {
  CartItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "discountedPrice" field.
  int? _discountedPrice;
  int get discountedPrice => _discountedPrice ?? 0;
  bool hasDiscountedPrice() => _discountedPrice != null;

  // "subtotal" field.
  int? _subtotal;
  int get subtotal => _subtotal ?? 0;
  bool hasSubtotal() => _subtotal != null;

  // "discounted_rate" field.
  int? _discountedRate;
  int get discountedRate => _discountedRate ?? 0;
  bool hasDiscountedRate() => _discountedRate != null;

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "brandName" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  bool hasBrandName() => _brandName != null;

  // "Main_Image" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  bool hasMainImage() => _mainImage != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "sellerId" field.
  String? _sellerId;
  String get sellerId => _sellerId ?? '';
  bool hasSellerId() => _sellerId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _price = castToType<int>(snapshotData['price']);
    _discountedPrice = castToType<int>(snapshotData['discountedPrice']);
    _subtotal = castToType<int>(snapshotData['subtotal']);
    _discountedRate = castToType<int>(snapshotData['discounted_rate']);
    _productName = snapshotData['productName'] as String?;
    _brandName = snapshotData['brandName'] as String?;
    _mainImage = snapshotData['Main_Image'] as String?;
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _sellerId = snapshotData['sellerId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cart_items')
          : FirebaseFirestore.instance.collectionGroup('cart_items');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cart_items').doc(id);

  static Stream<CartItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartItemsRecord.fromSnapshot(s));

  static Future<CartItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartItemsRecord.fromSnapshot(s));

  static CartItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CartItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartItemsRecordData({
  DateTime? createdAt,
  int? quantity,
  int? price,
  int? discountedPrice,
  int? subtotal,
  int? discountedRate,
  String? productName,
  String? brandName,
  String? mainImage,
  DocumentReference? productRef,
  String? sellerId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'quantity': quantity,
      'price': price,
      'discountedPrice': discountedPrice,
      'subtotal': subtotal,
      'discounted_rate': discountedRate,
      'productName': productName,
      'brandName': brandName,
      'Main_Image': mainImage,
      'productRef': productRef,
      'sellerId': sellerId,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartItemsRecordDocumentEquality implements Equality<CartItemsRecord> {
  const CartItemsRecordDocumentEquality();

  @override
  bool equals(CartItemsRecord? e1, CartItemsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.quantity == e2?.quantity &&
        e1?.price == e2?.price &&
        e1?.discountedPrice == e2?.discountedPrice &&
        e1?.subtotal == e2?.subtotal &&
        e1?.discountedRate == e2?.discountedRate &&
        e1?.productName == e2?.productName &&
        e1?.brandName == e2?.brandName &&
        e1?.mainImage == e2?.mainImage &&
        e1?.productRef == e2?.productRef &&
        e1?.sellerId == e2?.sellerId;
  }

  @override
  int hash(CartItemsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.quantity,
        e?.price,
        e?.discountedPrice,
        e?.subtotal,
        e?.discountedRate,
        e?.productName,
        e?.brandName,
        e?.mainImage,
        e?.productRef,
        e?.sellerId
      ]);

  @override
  bool isValidKey(Object? o) => o is CartItemsRecord;
}
