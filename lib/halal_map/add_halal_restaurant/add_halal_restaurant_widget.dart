import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_halal_restaurant_model.dart';
export 'add_halal_restaurant_model.dart';

class AddHalalRestaurantWidget extends StatefulWidget {
  const AddHalalRestaurantWidget({
    super.key,
    this.place,
  });

  final dynamic place;

  static String routeName = 'AddHalalRestaurant';
  static String routePath = '/AddHalalRestaurant';

  @override
  State<AddHalalRestaurantWidget> createState() =>
      _AddHalalRestaurantWidgetState();
}

class _AddHalalRestaurantWidgetState extends State<AddHalalRestaurantWidget> {
  late AddHalalRestaurantModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddHalalRestaurantModel());

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
        resizeToAvoidBottomInset: false,
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
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 4.0),
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
                            '6h8oq9ht' /* 할랄 음식점 추가 */,
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 100),
                              fadeOutDuration: Duration(milliseconds: 100),
                              imageUrl: functions.placeUrl(
                                  getJsonField(
                                    widget.place,
                                    r'''$.photos[0].name''',
                                  ).toString(),
                                  'AIzaSyCAY8XKYo-AA6wSXom_m_4KtdyhpNbzJik'),
                              width: double.infinity,
                              height: 160.0,
                              fit: BoxFit.cover,
                              errorWidget: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/error_image.png',
                                width: double.infinity,
                                height: 160.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    getJsonField(
                                      widget.place,
                                      r'''$.displayName.text''',
                                    )?.toString(),
                                    '-',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'ko',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        getJsonField(
                                          widget.place,
                                          r'''$.rating''',
                                        )?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'ko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 4.0, 0.0),
                                      child: RatingBarIndicator(
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                        ),
                                        direction: Axis.horizontal,
                                        rating: valueOrDefault<double>(
                                          getJsonField(
                                            widget.place,
                                            r'''$.rating''',
                                          ),
                                          0.0,
                                        ),
                                        unratedColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        itemCount: 5,
                                        itemSize: 20.0,
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'zu4kji2d' /* ( */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'ko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        getJsonField(
                                          widget.place,
                                          r'''$.userRatingCount''',
                                        )?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'ko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'rfa9x1xy' /* ) */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'ko',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_on_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      widget.place,
                                                      r'''$.formattedAddress''',
                                                    )?.toString(),
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'ko',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Clipboard.setData(
                                                      ClipboardData(
                                                          text: valueOrDefault<
                                                              String>(
                                                    getJsonField(
                                                      widget.place,
                                                      r'''$.formattedAddress''',
                                                    )?.toString(),
                                                    '-',
                                                  )));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          koText: '복사되었습니다!',
                                                          enText: 'Copied!',
                                                          idText: 'Disalin!',
                                                          bnText: 'কপি হয়েছে!',
                                                        ),
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '0tudcz0z' /* 복사 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'ko',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            Expanded(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  getJsonField(
                                                    widget.place,
                                                    r'''$.nationalPhoneNumber''',
                                                  )?.toString(),
                                                  '-',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'ko',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Clipboard.setData(
                                                      ClipboardData(
                                                          text: valueOrDefault<
                                                              String>(
                                                    getJsonField(
                                                      widget.place,
                                                      r'''$.nationalPhoneNumber''',
                                                    )?.toString(),
                                                    '-',
                                                  )));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          koText: '복사되었습니다!',
                                                          enText: 'Copied!',
                                                          idText: 'Disalin!',
                                                          bnText: 'কপি হয়েছে!',
                                                        ),
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '7xgaicri' /* 복사 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'ko',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.globeAsia,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (!((getJsonField(
                                                            widget.place,
                                                            r'''$.websiteUri''',
                                                          ) ==
                                                          null) ||
                                                      (getJsonField(
                                                            widget.place,
                                                            r'''$.websiteUri''',
                                                          ) ==
                                                          null))) {
                                                    await launchURL(
                                                        getJsonField(
                                                      widget.place,
                                                      r'''$.websiteUri''',
                                                    ).toString());
                                                  }
                                                },
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      widget.place,
                                                      r'''$.websiteUri''',
                                                    )?.toString(),
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'ko',
                                                        letterSpacing: 0.0,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Container(
                                    height: 160.0,
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: _model.googleMapsCenter != null,
                                      child: Builder(builder: (context) {
                                        final _googleMapMarker =
                                            functions.latlng(
                                                valueOrDefault<double>(
                                                  getJsonField(
                                                    widget.place,
                                                    r'''$.location.latitude''',
                                                  ),
                                                  0.0,
                                                ),
                                                valueOrDefault<double>(
                                                  getJsonField(
                                                    widget.place,
                                                    r'''$.location.longitude''',
                                                  ),
                                                  0.0,
                                                ));
                                        return FlutterFlowGoogleMap(
                                          controller:
                                              _model.googleMapsController,
                                          onCameraIdle: (latLng) =>
                                              _model.googleMapsCenter = latLng,
                                          initialLocation:
                                              _model.googleMapsCenter ??=
                                                  functions.latlng(
                                                      getJsonField(
                                                        widget.place,
                                                        r'''$.location.latitude''',
                                                      ),
                                                      getJsonField(
                                                        widget.place,
                                                        r'''$.location.longitude''',
                                                      )),
                                          markers: [
                                            FlutterFlowMarker(
                                              _googleMapMarker.serialize(),
                                              _googleMapMarker,
                                            ),
                                          ],
                                          markerColor: GoogleMarkerColor.red,
                                          mapType: MapType.normal,
                                          style: GoogleMapStyle.standard,
                                          initialZoom: 14.0,
                                          allowInteraction: false,
                                          allowZoom: false,
                                          showZoomControls: false,
                                          showLocation: false,
                                          showCompass: false,
                                          showMapToolbar: false,
                                          showTraffic: false,
                                          centerMapOnMarkerTap: false,
                                          mapTakesGesturePreference: false,
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'rosb9rcx' /* 추가한 음식점 정보는 모든 사용자에게 공개되며,
운영 ... */
                          ,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'ko',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.overlap = await queryHalalMapRecordOnce(
                          queryBuilder: (halalMapRecord) =>
                              halalMapRecord.where(
                            'name_ko',
                            isEqualTo: getJsonField(
                              widget.place,
                              r'''$.displayName.text''',
                            ).toString(),
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        if (_model.overlap?.reference != null) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: Text('레스토랑 중복'),
                                  content: Text('이미 등록된 레스토랑 입니다.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          var halalMapRecordReference =
                              HalalMapRecord.collection.doc();
                          await halalMapRecordReference
                              .set(createHalalMapRecordData(
                            lat: getJsonField(
                              widget.place,
                              r'''$.location.latitude''',
                            ),
                            lng: getJsonField(
                              widget.place,
                              r'''$.location.longitude''',
                            ),
                            rating: getJsonField(
                              widget.place,
                              r'''$.rating''',
                            ),
                            userRatingCount: getJsonField(
                              widget.place,
                              r'''$.userRatingCount''',
                            ),
                            uid: currentUserReference?.id,
                            createdAt: getCurrentTimestamp,
                            status: 'pending',
                            addressKo: getJsonField(
                              widget.place,
                              r'''$.formattedAddress''',
                            ).toString(),
                            regionGroup: functions.regiongroup(getJsonField(
                              widget.place,
                              r'''$.formattedAddress''',
                            ).toString()),
                            regionDetail: functions.regiondetail(getJsonField(
                              widget.place,
                              r'''$.formattedAddress''',
                            ).toString()),
                            nameKo: getJsonField(
                              widget.place,
                              r'''$.displayName.text''',
                            ).toString(),
                            phone: getJsonField(
                              widget.place,
                              r'''$.nationalPhoneNumber''',
                            ).toString(),
                            website: getJsonField(
                              widget.place,
                              r'''$.websiteUri''',
                            ).toString(),
                            photoName: getJsonField(
                              widget.place,
                              r'''$.photos[0].name''',
                            ).toString(),
                            openinghours: functions.translateWeekdays(
                                (getJsonField(
                                  widget.place,
                                  r'''$.currentOpeningHours.weekdayDescriptions''',
                                  true,
                                ) as List?)
                                    ?.map<String>((e) => e.toString())
                                    .toList()
                                    .cast<String>(),
                                FFLocalizations.of(context).languageCode),
                          ));
                          _model.createdocument =
                              HalalMapRecord.getDocumentFromData(
                                  createHalalMapRecordData(
                                    lat: getJsonField(
                                      widget.place,
                                      r'''$.location.latitude''',
                                    ),
                                    lng: getJsonField(
                                      widget.place,
                                      r'''$.location.longitude''',
                                    ),
                                    rating: getJsonField(
                                      widget.place,
                                      r'''$.rating''',
                                    ),
                                    userRatingCount: getJsonField(
                                      widget.place,
                                      r'''$.userRatingCount''',
                                    ),
                                    uid: currentUserReference?.id,
                                    createdAt: getCurrentTimestamp,
                                    status: 'pending',
                                    addressKo: getJsonField(
                                      widget.place,
                                      r'''$.formattedAddress''',
                                    ).toString(),
                                    regionGroup:
                                        functions.regiongroup(getJsonField(
                                      widget.place,
                                      r'''$.formattedAddress''',
                                    ).toString()),
                                    regionDetail:
                                        functions.regiondetail(getJsonField(
                                      widget.place,
                                      r'''$.formattedAddress''',
                                    ).toString()),
                                    nameKo: getJsonField(
                                      widget.place,
                                      r'''$.displayName.text''',
                                    ).toString(),
                                    phone: getJsonField(
                                      widget.place,
                                      r'''$.nationalPhoneNumber''',
                                    ).toString(),
                                    website: getJsonField(
                                      widget.place,
                                      r'''$.websiteUri''',
                                    ).toString(),
                                    photoName: getJsonField(
                                      widget.place,
                                      r'''$.photos[0].name''',
                                    ).toString(),
                                    openinghours: functions.translateWeekdays(
                                        (getJsonField(
                                          widget.place,
                                          r'''$.currentOpeningHours.weekdayDescriptions''',
                                          true,
                                        ) as List?)
                                            ?.map<String>((e) => e.toString())
                                            .toList()
                                            .cast<String>(),
                                        FFLocalizations.of(context)
                                            .languageCode),
                                  ),
                                  halalMapRecordReference);

                          context.pushNamed(
                            HalalRestaurantListWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        }

                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'byl6eksf' /* 할랄 음식점 추가하기 */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF009F6B),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'ko',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
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
