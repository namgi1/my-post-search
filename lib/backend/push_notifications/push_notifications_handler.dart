import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? isWeb
          ? Container()
          : Container(
              color: Colors.transparent,
              child: Image.asset(
                'assets/images/__(1024_x_500_px)-2.png',
                fit: BoxFit.cover,
              ),
            )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'ProductDetail': (data) async => ParameterData(
        allParams: {
          'productRef': getParameter<DocumentReference>(data, 'productRef'),
        },
      ),
  'Cart': ParameterData.none(),
  'Checkout': ParameterData.none(),
  'search': ParameterData.none(),
  'Category': ParameterData.none(),
  'Mypage': ParameterData.none(),
  'ProductList_category': (data) async => ParameterData(
        allParams: {
          'maincategory': getParameter<String>(data, 'maincategory'),
          'subcategory': getParameter<String>(data, 'subcategory'),
        },
      ),
  'Manage_Information': ParameterData.none(),
  'Change_MyInformation': ParameterData.none(),
  'Address': ParameterData.none(),
  'SignUp1': (data) async => ParameterData(
        allParams: {
          'userEmail': getParameter<String>(data, 'userEmail'),
          'userName': getParameter<String>(data, 'userName'),
          'method': getParameter<String>(data, 'method'),
        },
      ),
  'SelectedAddress': ParameterData.none(),
  'navigateHomepage': ParameterData.none(),
  'Login': ParameterData.none(),
  'Add_Address': (data) async => ParameterData(
        allParams: {
          'roadaddress': getParameter<String>(data, 'roadaddress'),
          'address': getParameter<String>(data, 'address'),
        },
      ),
  'Address_Refresh': ParameterData.none(),
  'Edit_Address': (data) async => ParameterData(
        allParams: {
          'addressToEdit': await getDocumentParameter<AddressesRecord>(
              data, 'addressToEdit', AddressesRecord.fromSnapshot),
        },
      ),
  'OrderDetail': (data) async => ParameterData(
        allParams: {
          'orderId': getParameter<String>(data, 'orderId'),
        },
      ),
  'Cart_Refresh': ParameterData.none(),
  'OrderList': ParameterData.none(),
  'paymentsuccess': (data) async => ParameterData(
        allParams: {
          'orderId': getParameter<String>(data, 'orderId'),
        },
      ),
  'DeliverySearch': (data) async => ParameterData(
        allParams: {
          'deliverycode': getParameter<String>(data, 'deliverycode'),
          'deliverynumber': getParameter<String>(data, 'deliverynumber'),
        },
      ),
  'ProductList_search': (data) async => ParameterData(
        allParams: {
          'searchword': getParameter<String>(data, 'searchword'),
        },
      ),
  'AllProducts': (data) async => ParameterData(
        allParams: {
          'option': getParameter<String>(data, 'option'),
        },
      ),
  'Review': (data) async => ParameterData(
        allParams: {
          'productId': getParameter<String>(data, 'productId'),
          'reviewId': getParameter<String>(data, 'reviewId'),
          'orderId': getParameter<String>(data, 'orderId'),
        },
      ),
  'Marketing_Push': ParameterData.none(),
  'checkout2': (data) async => ParameterData(
        allParams: {
          'checkoutUrl': getParameter<String>(data, 'checkoutUrl'),
        },
      ),
  'Language': ParameterData.none(),
  'term': ParameterData.none(),
  'privacy': ParameterData.none(),
  'Reviewlist': (data) async => ParameterData(
        allParams: {
          'productRef': getParameter<DocumentReference>(data, 'productRef'),
        },
      ),
  'MyReviews': ParameterData.none(),
  'navigateMyReviews': ParameterData.none(),
  'OrderCancel': (data) async => ParameterData(
        allParams: {
          'orderId': getParameter<String>(data, 'orderId'),
        },
      ),
  'coupon_list': ParameterData.none(),
  'Mypoint': ParameterData.none(),
  'HalalCert': (data) async => ParameterData(
        allParams: {
          'certNo': getParameter<String>(data, 'certNo'),
        },
      ),
  'deliverypolicy': ParameterData.none(),
  'HalalRestaurantMap': ParameterData.none(),
  'AddHalalRestaurant': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'HalalRestaurantSearch': ParameterData.none(),
  'HalalRestaurantList': (data) async => ParameterData(
        allParams: {
          'regiongroup': getParameter<String>(data, 'regiongroup'),
          'regiondetail': getParameter<String>(data, 'regiondetail'),
        },
      ),
  'HalalRestaurant': (data) async => ParameterData(
        allParams: {
          'halalrestaurant':
              getParameter<DocumentReference>(data, 'halalrestaurant'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
