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

  // "orderId" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "orderItems" field.
  List<OrderItemStruct>? _orderItems;
  List<OrderItemStruct> get orderItems => _orderItems ?? const [];
  bool hasOrderItems() => _orderItems != null;

  // "orderStatus" field.
  String? _orderStatus;
  String get orderStatus => _orderStatus ?? '';
  bool hasOrderStatus() => _orderStatus != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "shippingAddress" field.
  ShippingAddressStruct? _shippingAddress;
  ShippingAddressStruct get shippingAddress =>
      _shippingAddress ?? ShippingAddressStruct();
  bool hasShippingAddress() => _shippingAddress != null;

  // "paymentMethod" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _orderId = snapshotData['orderId'] as String?;
    _totalPrice = castToType<double>(snapshotData['totalPrice']);
    _orderItems = getStructList(
      snapshotData['orderItems'],
      OrderItemStruct.fromMap,
    );
    _orderStatus = snapshotData['orderStatus'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _shippingAddress = snapshotData['shippingAddress'] is ShippingAddressStruct
        ? snapshotData['shippingAddress']
        : ShippingAddressStruct.maybeFromMap(snapshotData['shippingAddress']);
    _paymentMethod = snapshotData['paymentMethod'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

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
  String? orderId,
  double? totalPrice,
  String? orderStatus,
  DocumentReference? uid,
  ShippingAddressStruct? shippingAddress,
  String? paymentMethod,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'orderId': orderId,
      'totalPrice': totalPrice,
      'orderStatus': orderStatus,
      'uid': uid,
      'shippingAddress': ShippingAddressStruct().toMap(),
      'paymentMethod': paymentMethod,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  // Handle nested data for "shippingAddress" field.
  addShippingAddressStructData(
      firestoreData, shippingAddress, 'shippingAddress');

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.orderId == e2?.orderId &&
        e1?.totalPrice == e2?.totalPrice &&
        listEquality.equals(e1?.orderItems, e2?.orderItems) &&
        e1?.orderStatus == e2?.orderStatus &&
        e1?.uid == e2?.uid &&
        e1?.shippingAddress == e2?.shippingAddress &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.orderId,
        e?.totalPrice,
        e?.orderItems,
        e?.orderStatus,
        e?.uid,
        e?.shippingAddress,
        e?.paymentMethod,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
