import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "items" field.
  List<ItemsStruct>? _items;
  List<ItemsStruct> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "total_amount" field.
  int? _totalAmount;
  int get totalAmount => _totalAmount ?? 0;
  bool hasTotalAmount() => _totalAmount != null;

  // "address_ref_path" field.
  DocumentReference? _addressRefPath;
  DocumentReference? get addressRefPath => _addressRefPath;
  bool hasAddressRefPath() => _addressRefPath != null;

  // "orderId" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "shipping_address" field.
  ShippingAddressStruct? _shippingAddress;
  ShippingAddressStruct get shippingAddress =>
      _shippingAddress ?? ShippingAddressStruct();
  bool hasShippingAddress() => _shippingAddress != null;

  // "paidAt" field.
  DateTime? _paidAt;
  DateTime? get paidAt => _paidAt;
  bool hasPaidAt() => _paidAt != null;

  // "cancel_respon" field.
  String? _cancelRespon;
  String get cancelRespon => _cancelRespon ?? '';
  bool hasCancelRespon() => _cancelRespon != null;

  // "couponRef" field.
  DocumentReference? _couponRef;
  DocumentReference? get couponRef => _couponRef;
  bool hasCouponRef() => _couponRef != null;

  // "coupon_discount" field.
  int? _couponDiscount;
  int get couponDiscount => _couponDiscount ?? 0;
  bool hasCouponDiscount() => _couponDiscount != null;

  // "point_discount" field.
  int? _pointDiscount;
  int get pointDiscount => _pointDiscount ?? 0;
  bool hasPointDiscount() => _pointDiscount != null;

  // "deliveryFee" field.
  int? _deliveryFee;
  int get deliveryFee => _deliveryFee ?? 0;
  bool hasDeliveryFee() => _deliveryFee != null;

  // "product_amount" field.
  int? _productAmount;
  int get productAmount => _productAmount ?? 0;
  bool hasProductAmount() => _productAmount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _items = getStructList(
      snapshotData['items'],
      ItemsStruct.fromMap,
    );
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _totalAmount = castToType<int>(snapshotData['total_amount']);
    _addressRefPath = snapshotData['address_ref_path'] as DocumentReference?;
    _orderId = snapshotData['orderId'] as String?;
    _shippingAddress = snapshotData['shipping_address'] is ShippingAddressStruct
        ? snapshotData['shipping_address']
        : ShippingAddressStruct.maybeFromMap(snapshotData['shipping_address']);
    _paidAt = snapshotData['paidAt'] as DateTime?;
    _cancelRespon = snapshotData['cancel_respon'] as String?;
    _couponRef = snapshotData['couponRef'] as DocumentReference?;
    _couponDiscount = castToType<int>(snapshotData['coupon_discount']);
    _pointDiscount = castToType<int>(snapshotData['point_discount']);
    _deliveryFee = castToType<int>(snapshotData['deliveryFee']);
    _productAmount = castToType<int>(snapshotData['product_amount']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('orders')
          : FirebaseFirestore.instance.collectionGroup('orders');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('orders').doc(id);

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? status,
  DateTime? createdAt,
  int? totalAmount,
  DocumentReference? addressRefPath,
  String? orderId,
  ShippingAddressStruct? shippingAddress,
  DateTime? paidAt,
  String? cancelRespon,
  DocumentReference? couponRef,
  int? couponDiscount,
  int? pointDiscount,
  int? deliveryFee,
  int? productAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'created_at': createdAt,
      'total_amount': totalAmount,
      'address_ref_path': addressRefPath,
      'orderId': orderId,
      'shipping_address': ShippingAddressStruct().toMap(),
      'paidAt': paidAt,
      'cancel_respon': cancelRespon,
      'couponRef': couponRef,
      'coupon_discount': couponDiscount,
      'point_discount': pointDiscount,
      'deliveryFee': deliveryFee,
      'product_amount': productAmount,
    }.withoutNulls,
  );

  // Handle nested data for "shipping_address" field.
  addShippingAddressStructData(
      firestoreData, shippingAddress, 'shipping_address');

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.items, e2?.items) &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.totalAmount == e2?.totalAmount &&
        e1?.addressRefPath == e2?.addressRefPath &&
        e1?.orderId == e2?.orderId &&
        e1?.shippingAddress == e2?.shippingAddress &&
        e1?.paidAt == e2?.paidAt &&
        e1?.cancelRespon == e2?.cancelRespon &&
        e1?.couponRef == e2?.couponRef &&
        e1?.couponDiscount == e2?.couponDiscount &&
        e1?.pointDiscount == e2?.pointDiscount &&
        e1?.deliveryFee == e2?.deliveryFee &&
        e1?.productAmount == e2?.productAmount;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.items,
        e?.status,
        e?.createdAt,
        e?.totalAmount,
        e?.addressRefPath,
        e?.orderId,
        e?.shippingAddress,
        e?.paidAt,
        e?.cancelRespon,
        e?.couponRef,
        e?.couponDiscount,
        e?.pointDiscount,
        e?.deliveryFee,
        e?.productAmount
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
