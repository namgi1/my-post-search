import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'mypoint_model.dart';
export 'mypoint_model.dart';

class MypointWidget extends StatefulWidget {
  const MypointWidget({super.key});

  static String routeName = 'Mypoint';
  static String routePath = '/Mypoint';

  @override
  State<MypointWidget> createState() => _MypointWidgetState();
}

class _MypointWidgetState extends State<MypointWidget> {
  late MypointModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MypointModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userRef = await UsersRecord.getDocumentOnce(currentUserReference!);
      _model.point = await queryPointsRecordOnce(
        parent: currentUserReference,
        queryBuilder: (pointsRecord) =>
            pointsRecord.orderBy('created_at', descending: true),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
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
                            'sh96smhp' /* 포인트 */,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'jejylr2m' /* 현재 포인트 */,
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'ko',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            formatNumber(
                              _model.userRef?.totalPoints,
                              formatType: FormatType.decimal,
                              decimalType: DecimalType.periodDecimal,
                            ),
                            '0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'ko',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '7tsmm9v0' /* P */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'ko',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final points = _model.point
                                  ?.where((e) => e.amount != 0)
                                  .toList()
                                  .toList() ??
                              [];

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(points.length, (pointsIndex) {
                                final pointsItem = points[pointsIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              functions.hourAndMinute(pointsItem
                                                  .createdAt
                                                  ?.toString()),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'ko',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (pointsItem.reviewId != '') {
                                                  unawaited(
                                                    () async {
                                                      _model.reviewRef = await ReviewsRecord
                                                          .getDocumentOnce(
                                                              functions.reviewRef(
                                                                  pointsItem
                                                                      .productId,
                                                                  pointsItem
                                                                      .reviewId));
                                                    }(),
                                                  );
                                                  await Future.delayed(
                                                    Duration(
                                                      milliseconds: 500,
                                                    ),
                                                  );
                                                  if (_model.reviewRef
                                                              ?.reference.id ==
                                                          null ||
                                                      _model.reviewRef
                                                              ?.reference.id ==
                                                          '') {
                                                    context.pushNamed(
                                                      OrderDetailWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'orderId':
                                                            serializeParam(
                                                          pointsItem.orderId,
                                                          ParamType.String,
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
                                                  } else {
                                                    context.pushNamed(
                                                      ReviewWidget.routeName,
                                                      queryParameters: {
                                                        'productId':
                                                            serializeParam(
                                                          pointsItem.productId,
                                                          ParamType.String,
                                                        ),
                                                        'orderId':
                                                            serializeParam(
                                                          pointsItem.orderId,
                                                          ParamType.String,
                                                        ),
                                                        'reviewId':
                                                            serializeParam(
                                                          pointsItem.reviewId,
                                                          ParamType.String,
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
                                                  }
                                                } else {
                                                  context.pushNamed(
                                                    OrderDetailWidget.routeName,
                                                    queryParameters: {
                                                      'orderId': serializeParam(
                                                        pointsItem.orderId,
                                                        ParamType.String,
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
                                                }

                                                safeSetState(() {});
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ec8j4w6s' /* 자세히 보기 > */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'ko',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      () {
                                                        if (pointsItem.type ==
                                                            'earned') {
                                                          return FFLocalizations
                                                                  .of(context)
                                                              .getVariableText(
                                                            koText: '구매 적립 포인트',
                                                            enText:
                                                                'Purchase Points',
                                                            idText:
                                                                'Poin Didapat',
                                                            bnText:
                                                                'ক্রয় পয়েন্ট',
                                                          );
                                                        } else if (pointsItem
                                                                .type ==
                                                            'used') {
                                                          return FFLocalizations
                                                                  .of(context)
                                                              .getVariableText(
                                                            koText: '포인트 사용',
                                                            enText:
                                                                'Use Points',
                                                            idText:
                                                                'Gunakan Poin',
                                                            bnText:
                                                                'পয়েন্ট ব্যবহার করুন',
                                                          );
                                                        } else if (pointsItem
                                                                .type ==
                                                            'refund') {
                                                          return FFLocalizations
                                                                  .of(context)
                                                              .getVariableText(
                                                            koText:
                                                                '주문 취소로 인한 포인트 환불',
                                                            enText:
                                                                'Points refunded due to order cancellation',
                                                            idText:
                                                                'Poin dikembalikan karena pembatalan pesanan',
                                                            bnText:
                                                                'অর্ডার বাতিলের কারণে পয়েন্ট ফেরত',
                                                          );
                                                        } else if (pointsItem
                                                                .type ==
                                                            'rollback') {
                                                          return FFLocalizations
                                                                  .of(context)
                                                              .getVariableText(
                                                            koText:
                                                                '주문 취소로 인한 포인트 회수',
                                                            enText:
                                                                'Points revoked due to order cancellation',
                                                            idText:
                                                                'Poin dikurangi karena pembatalan pesanan',
                                                            bnText:
                                                                'অর্ডার বাতিলের কারণে পয়েন্ট প্রত্যাহার',
                                                          );
                                                        } else if (pointsItem
                                                                .type ==
                                                            'review') {
                                                          return FFLocalizations
                                                                  .of(context)
                                                              .getVariableText(
                                                            koText:
                                                                '리뷰 작성 포인트 적립',
                                                            enText:
                                                                'Points earned for review',
                                                            idText:
                                                                'Poin diperoleh dari ulasan',
                                                            bnText:
                                                                'রিভিউ লিখলে পয়েন্ট প্রাপ্ত',
                                                          );
                                                        } else if (pointsItem
                                                                .type ==
                                                            'reviewrollback') {
                                                          return FFLocalizations
                                                                  .of(context)
                                                              .getVariableText(
                                                            koText:
                                                                '리뷰 작성 포인트 회수',
                                                            enText:
                                                                'Points revoked for review',
                                                            idText:
                                                                'Poin dikurangi dari ulasan',
                                                            bnText:
                                                                'রিভিউ পয়েন্ট প্রত্যাহার',
                                                          );
                                                        } else {
                                                          return pointsItem
                                                              .type;
                                                        }
                                                      }(),
                                                      maxLines: 3,
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                            if (pointsItem.amount > 0)
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'q2ua6kxq' /* + */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'ko',
                                                      color: pointsItem.amount >
                                                              0
                                                          ? Color(0xFF009F6B)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            Text(
                                              formatNumber(
                                                pointsItem.amount,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'ko',
                                                    color: pointsItem.amount > 0
                                                        ? Color(0xFF009F6B)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ihu3slz4' /* P */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'ko',
                                                    color: pointsItem.amount > 0
                                                        ? Color(0xFF009F6B)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            border: Border.all(
                                              color: Color(0xFFBDBDBD),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
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
