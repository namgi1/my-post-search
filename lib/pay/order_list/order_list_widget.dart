import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/go_cart/go_cart_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'order_list_model.dart';
export 'order_list_model.dart';

class OrderListWidget extends StatefulWidget {
  const OrderListWidget({super.key});

  static String routeName = 'OrderList';
  static String routePath = '/orderList';

  @override
  State<OrderListWidget> createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  late OrderListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.orderList = await queryOrdersRecordOnce(
        parent: currentUserReference,
        queryBuilder: (ordersRecord) => ordersRecord.whereIn(
            'status', ['paid', 'cancel']).orderBy('paidAt', descending: true),
      );

      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width < kBreakpointLarge
                  ? double.infinity
                  : 600.0,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.chevron_left,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '4xb3nzu4' /* 주문 내역 */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'ko',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0,
                          0.0,
                          16.0,
                          valueOrDefault<double>(
                            isWeb
                                ? (isWeb
                                    ? () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointLarge) {
                                          return 60.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 60.0;
                                        } else {
                                          return 0.0;
                                        }
                                      }()
                                    : 96.0)
                                : 96.0,
                            0.0,
                          )),
                      child: Builder(
                        builder: (context) {
                          final orders = _model.orderList?.toList() ?? [];

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: orders.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, ordersIndex) {
                              final ordersItem = orders[ordersIndex];
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              OrderDetailWidget.routeName,
                                              queryParameters: {
                                                'orderId': serializeParam(
                                                  ordersItem.reference.id,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                functions.hourAndMinute(
                                                    ordersItem.paidAt
                                                        ?.toString()),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'ko',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'vft1lmvg' /* 주문 상세 보기 > */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'ko',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (ordersItem.status == 'cancel')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 8.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'du3ubsem' /* 고객님의 요청으로 취소된 상품입니다. */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'ko',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Color(0x33000000),
                                          ),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final orderitem =
                                                ordersItem.items.toList();

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: orderitem.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 8.0),
                                              itemBuilder:
                                                  (context, orderitemIndex) {
                                                final orderitemItem =
                                                    orderitem[orderitemIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      ProductDetailWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'productRef':
                                                            serializeParam(
                                                          functions.productRef(
                                                              orderitemItem
                                                                  .productId),
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 116.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Hero(
                                                            tag: orderitemItem
                                                                .mainImage,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            100),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            100),
                                                                imageUrl:
                                                                    orderitemItem
                                                                        .mainImage,
                                                                width: 100.0,
                                                                height: 100.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            orderitemItem.productName,
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'ko',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              functions.formatPrice(orderitemItem.discountedPrice),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'ko',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '${orderitemItem.quantity.toString()} ${() {
                                                                                    if (orderitemItem.quantity == 1) {
                                                                                      return FFLocalizations.of(context).getVariableText(
                                                                                        koText: '개',
                                                                                        enText: 'item',
                                                                                        idText: 'item',
                                                                                        bnText: 'আইটেম',
                                                                                      );
                                                                                    } else if (orderitemItem.quantity != 1) {
                                                                                      return FFLocalizations.of(context).getVariableText(
                                                                                        koText: '개',
                                                                                        enText: 'items',
                                                                                        idText: 'item',
                                                                                        bnText: 'আইটেম',
                                                                                      );
                                                                                    } else {
                                                                                      return '';
                                                                                    }
                                                                                  }()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'ko',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (ordersItem
                                                                          .status ==
                                                                      'paid')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              if (orderitemItem.reviewId != '') {
                                                                                context.pushNamed(
                                                                                  ReviewWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'productId': serializeParam(
                                                                                      orderitemItem.productId,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'reviewId': serializeParam(
                                                                                      orderitemItem.reviewId,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'orderId': serializeParam(
                                                                                      ordersItem.orderId,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    '__transition_info__': TransitionInfo(
                                                                                      hasTransition: true,
                                                                                      transitionType: PageTransitionType.fade,
                                                                                      duration: Duration(milliseconds: 0),
                                                                                    ),
                                                                                  },
                                                                                );
                                                                              } else {
                                                                                context.pushNamed(
                                                                                  ReviewWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'productId': serializeParam(
                                                                                      orderitemItem.productId,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'orderId': serializeParam(
                                                                                      ordersItem.orderId,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    '__transition_info__': TransitionInfo(
                                                                                      hasTransition: true,
                                                                                      transitionType: PageTransitionType.fade,
                                                                                      duration: Duration(milliseconds: 0),
                                                                                    ),
                                                                                  },
                                                                                );
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 112.0,
                                                                              decoration: BoxDecoration(
                                                                                border: Border.all(
                                                                                  color: Color(0x33000000),
                                                                                ),
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                  child: Text(
                                                                                    orderitemItem.reviewId != ''
                                                                                        ? FFLocalizations.of(context).getVariableText(
                                                                                            koText: '리뷰 수정하기',
                                                                                            enText: 'Edit Review',
                                                                                            idText: 'Ubah Ulasan',
                                                                                            bnText: 'রিভিউ সংশোধন',
                                                                                          )
                                                                                        : FFLocalizations.of(context).getVariableText(
                                                                                            koText: '리뷰 작성',
                                                                                            enText: 'Write Review',
                                                                                            idText: 'Tulis Ulasan',
                                                                                            bnText: 'রিভিউ লিখুন',
                                                                                          ),
                                                                                    textAlign: TextAlign.center,
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'ko',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              if (orderitemItem.deliveryStatus != '배송 완료') {
                                                                                if ((orderitemItem.deliveryNumber != '') && (orderitemItem.deliveryCode != '')) {
                                                                                  context.pushNamed(
                                                                                    DeliverySearchWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'deliverycode': serializeParam(
                                                                                        orderitemItem.deliveryCode,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'deliverynumber': serializeParam(
                                                                                        orderitemItem.deliveryNumber,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      '__transition_info__': TransitionInfo(
                                                                                        hasTransition: true,
                                                                                        transitionType: PageTransitionType.fade,
                                                                                        duration: Duration(milliseconds: 0),
                                                                                      ),
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return WebViewAware(
                                                                                        child: AlertDialog(
                                                                                          title: Text(FFLocalizations.of(context).getVariableText(
                                                                                            koText: '배송 준비중이에요',
                                                                                            enText: 'Preparing for shipment',
                                                                                            idText: 'Sedang disiapkan',
                                                                                            bnText: 'প্রস্তুত করা হচ্ছে',
                                                                                          )),
                                                                                          content: Text(FFLocalizations.of(context).getVariableText(
                                                                                            koText: '주문하신 상품을 준비하고 있어요.',
                                                                                            enText: 'We’re preparing your order.',
                                                                                            idText: 'Pesanan Anda sedang disiapkan.',
                                                                                            bnText: 'আপনার অর্ডার প্রস্তুত করা হচ্ছে।',
                                                                                          )),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text(FFLocalizations.of(context).getVariableText(
                                                                                                koText: '확인',
                                                                                                enText: 'OK',
                                                                                                idText: 'OK',
                                                                                                bnText: 'ঠিক আছে',
                                                                                              )),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                }
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 112.0,
                                                                              decoration: BoxDecoration(
                                                                                border: Border.all(
                                                                                  color: Color(0xFF009F6B),
                                                                                ),
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                  child: Text(
                                                                                    orderitemItem.deliveryStatus == '배송 완료'
                                                                                        ? FFLocalizations.of(context).getVariableText(
                                                                                            koText: '배송 완료',
                                                                                            enText: 'Delivered',
                                                                                            idText: 'Terkirim',
                                                                                            bnText: 'ডেলিভারি সম্পন্ন',
                                                                                          )
                                                                                        : FFLocalizations.of(context).getVariableText(
                                                                                            koText: '배송 조회',
                                                                                            enText: 'Track Order',
                                                                                            idText: 'Lacak Pesanan',
                                                                                            bnText: 'অর্ডার ট্র্যাক করুন',
                                                                                          ),
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'ko',
                                                                                          color: Color(0xFF009F6B),
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                    ),
                                                                  if (ordersItem
                                                                          .status ==
                                                                      'cancel')
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            120.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.productRef =
                                                                                await ProductsRecord.getDocumentOnce(functions.productRef(orderitemItem.productId));
                                                                            _model.cartQueryResult =
                                                                                await queryCartItemsRecordOnce(
                                                                              parent: currentUserReference,
                                                                              queryBuilder: (cartItemsRecord) => cartItemsRecord.where(
                                                                                'productRef',
                                                                                isEqualTo: functions.productRef(orderitemItem.productId),
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            if (_model.cartQueryResult?.reference !=
                                                                                null) {
                                                                              await _model.cartQueryResult!.reference.update(createCartItemsRecordData(
                                                                                quantity: 1,
                                                                                subtotal: _model.productRef!.discountedPrice * 1,
                                                                              ));
                                                                            } else {
                                                                              var cartItemsRecordReference = CartItemsRecord.createDoc(currentUserReference!);
                                                                              await cartItemsRecordReference.set(createCartItemsRecordData(
                                                                                productRef: _model.productRef?.reference,
                                                                                quantity: 1,
                                                                                createdAt: getCurrentTimestamp,
                                                                                productName: _model.productRef?.productName,
                                                                                mainImage: _model.productRef?.mainImage,
                                                                                brandName: _model.productRef?.brandName,
                                                                                price: _model.productRef?.price,
                                                                                subtotal: _model.productRef!.discountedPrice * 1,
                                                                                discountedPrice: _model.productRef?.discountedPrice,
                                                                                discountedRate: _model.productRef?.discountedRate,
                                                                                sellerId: _model.productRef?.sellerId,
                                                                              ));
                                                                              _model.addCart = CartItemsRecord.getDocumentFromData(
                                                                                  createCartItemsRecordData(
                                                                                    productRef: _model.productRef?.reference,
                                                                                    quantity: 1,
                                                                                    createdAt: getCurrentTimestamp,
                                                                                    productName: _model.productRef?.productName,
                                                                                    mainImage: _model.productRef?.mainImage,
                                                                                    brandName: _model.productRef?.brandName,
                                                                                    price: _model.productRef?.price,
                                                                                    subtotal: _model.productRef!.discountedPrice * 1,
                                                                                    discountedPrice: _model.productRef?.discountedPrice,
                                                                                    discountedRate: _model.productRef?.discountedRate,
                                                                                    sellerId: _model.productRef?.sellerId,
                                                                                  ),
                                                                                  cartItemsRecordReference);
                                                                            }

                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              enableDrag: false,
                                                                              useSafeArea: true,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return WebViewAware(
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(context).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: Container(
                                                                                        height: 480.0,
                                                                                        child: GoCartWidget(
                                                                                          productImage: _model.productRef!.mainImage,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                112.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              border: Border.all(
                                                                                color: Color(0x33000000),
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'ro92gvi7' /* 장바구니 담기 */,
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                  maxLines: 1,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'ko',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
