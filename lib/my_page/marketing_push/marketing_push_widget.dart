import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'marketing_push_model.dart';
export 'marketing_push_model.dart';

class MarketingPushWidget extends StatefulWidget {
  const MarketingPushWidget({super.key});

  static String routeName = 'Marketing_Push';
  static String routePath = '/Marketing_Push';

  @override
  State<MarketingPushWidget> createState() => _MarketingPushWidgetState();
}

class _MarketingPushWidgetState extends State<MarketingPushWidget> {
  late MarketingPushModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketingPushModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.marketingRef = await queryConsentsRecordOnce(
        parent: currentUserReference,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      safeSetState(() {
        _model.switchValue1 = _model.marketingRef!.isMarketingPushAgreed;
      });
      safeSetState(() {
        _model.switchValue2 = _model.marketingRef!.isMarketingSmsAgreed;
      });
      safeSetState(() {
        _model.switchValue3 = _model.marketingRef!.isMarketingEmailAgreed;
      });
    });

    _model.switchValue1 = false;
    _model.switchValue2 = false;
    _model.switchValue3 = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            context.pop();
                          },
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'lw8p9xh4' /* 마케팅 수신 동의 */,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 350.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'bhaa53ws' /* 푸시 알림 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'ko',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Switch.adaptive(
                                value: _model.switchValue1!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue1 = newValue);
                                  if (newValue) {
                                    await _model.marketingRef!.reference
                                        .update(createConsentsRecordData(
                                      isMarketingPushAgreed:
                                          _model.switchValue1,
                                      isMarketingPushAgreedAt:
                                          getCurrentTimestamp,
                                    ));
                                  } else {
                                    await _model.marketingRef!.reference
                                        .update(createConsentsRecordData(
                                      isMarketingPushAgreed:
                                          _model.switchValue1,
                                      isMarketingPushAgreedAt:
                                          getCurrentTimestamp,
                                    ));
                                  }
                                },
                                activeColor: Color(0xFF009F6B),
                                activeTrackColor: Color(0xFF009F6B),
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).alternate,
                                inactiveThumbColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 350.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'hp8rx6zg' /* 문자 알림 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'ko',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Switch.adaptive(
                                value: _model.switchValue2!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue2 = newValue);
                                  if (newValue) {
                                    await _model.marketingRef!.reference
                                        .update(createConsentsRecordData(
                                      isMarketingSmsAgreed: _model.switchValue2,
                                      isMarketingSmsAgreedAt:
                                          getCurrentTimestamp,
                                    ));
                                  } else {
                                    await _model.marketingRef!.reference
                                        .update(createConsentsRecordData(
                                      isMarketingSmsAgreed: _model.switchValue2,
                                      isMarketingSmsAgreedAt:
                                          getCurrentTimestamp,
                                    ));
                                  }
                                },
                                activeColor: Color(0xFF009F6B),
                                activeTrackColor: Color(0xFF009F6B),
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).alternate,
                                inactiveThumbColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 350.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '8zzqe89k' /* 이메일 알림 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'ko',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Switch.adaptive(
                                value: _model.switchValue3!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue3 = newValue);
                                  if (newValue) {
                                    await _model.marketingRef!.reference
                                        .update(createConsentsRecordData(
                                      isMarketingEmailAgreed:
                                          _model.switchValue3,
                                      isMarketingEmailAgreedAt:
                                          getCurrentTimestamp,
                                    ));
                                  } else {
                                    await _model.marketingRef!.reference
                                        .update(createConsentsRecordData(
                                      isMarketingEmailAgreed:
                                          _model.switchValue3,
                                      isMarketingEmailAgreedAt:
                                          getCurrentTimestamp,
                                    ));
                                  }
                                },
                                activeColor: Color(0xFF009F6B),
                                activeTrackColor: Color(0xFF009F6B),
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).alternate,
                                inactiveThumbColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ],
                          ),
                        ),
                      ],
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
