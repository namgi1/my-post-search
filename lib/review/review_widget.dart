import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'review_model.dart';
export 'review_model.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({
    super.key,
    required this.productId,
    this.reviewId,
    required this.orderId,
  });

  final String? productId;
  final String? reviewId;
  final String? orderId;

  static String routeName = 'Review';
  static String routePath = '/review';

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  late ReviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.reviewId != null && widget.reviewId != '') {
        _model.reviewRef = await ReviewsRecord.getDocumentOnce(
            functions.reviewRef(widget.productId!, widget.reviewId!));
        safeSetState(() {
          _model.ratingBarValue = _model.reviewRef!.rating;
        });
        safeSetState(() {
          _model.textController?.text = _model.reviewRef!.comment;
        });
      }
      _model.productRef = await ProductsRecord.getDocumentOnce(
          functions.productRef(widget.productId!));

      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
                          widget.reviewId != null && widget.reviewId != ''
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (_model.productRef?.mainImage != null &&
                                    _model.productRef?.mainImage != '')
                                  Hero(
                                    tag: _model.productRef!.mainImage,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        _model.productRef!.mainImage,
                                        width: 80.0,
                                        height: 80.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.productRef?.productName,
                                            'productName',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'ko',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 30.0, 0.0, 0.0),
                                        child: RatingBar.builder(
                                          onRatingUpdate: (newValue) =>
                                              safeSetState(() => _model
                                                  .ratingBarValue = newValue),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                          ),
                                          direction: Axis.horizontal,
                                          initialRating:
                                              _model.ratingBarValue ??=
                                                  _model.reviewRef?.reference !=
                                                          null
                                                      ? _model.reviewRef!.rating
                                                      : 0.0,
                                          unratedColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          itemCount: 5,
                                          itemSize: 32.0,
                                          glowColor:
                                              FlutterFlowTheme.of(context)
                                                  .warning,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (_model.ratingBarValue! > 0.0)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '6f34kq7d' /* 상품 후기 작성 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'ko',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        if (widget.reviewId == null ||
                                            widget.reviewId == '')
                                          Container(
                                            height: 24.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/_2025-10-12__3.47.27.png',
                                                ).image,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 16.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'g8ews46f' /* 사진+후기 작성 시 100포인트 적립 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'ko',
                                                        color:
                                                            Color(0xFF009F6B),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'ko',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'hac7gay1' /* 이 상품의 후기를 남겨주세요! */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'ko',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x33000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'ko',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLines: 7,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final selectedMedia =
                                                  await selectMedia(
                                                mediaSource:
                                                    MediaSource.photoGallery,
                                                multiImage: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                safeSetState(() => _model
                                                        .isDataUploading_uploadDataT3s =
                                                    true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                                originalFilename:
                                                                    m.originalFilename,
                                                              ))
                                                          .toList();

                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading_uploadDataT3s =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFiles_uploadDataT3s =
                                                        selectedUploadedFiles;
                                                    _model.uploadedFileUrls_uploadDataT3s =
                                                        downloadUrls;
                                                  });
                                                } else {
                                                  safeSetState(() {});
                                                  return;
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: 84.0,
                                              height: 84.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: Color(0x33000000),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.camera_alt,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'skqb5e74' /* 사진 등록 */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'ko',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            child: Builder(
                                              builder: (context) {
                                                final reviewPhoto = ((_model
                                                                    .uploadedFileUrls_uploadDataT3s
                                                                    .isNotEmpty
                                                                ? _model
                                                                    .uploadedFileUrls_uploadDataT3s
                                                                : _model
                                                                    .reviewRef
                                                                    ?.imageUrls)
                                                            ?.toList() ??
                                                        [])
                                                    .take(9)
                                                    .toList();

                                                return GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 8.0,
                                                    mainAxisSpacing: 8.0,
                                                    childAspectRatio: 1.0,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: reviewPhoto.length,
                                                  itemBuilder: (context,
                                                      reviewPhotoIndex) {
                                                    final reviewPhotoItem =
                                                        reviewPhoto[
                                                            reviewPhotoIndex];
                                                    return ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        reviewPhotoItem,
                                                        width: 80.0,
                                                        height: 80.0,
                                                        fit: BoxFit.contain,
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
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (_model.ratingBarValue! > 0.0)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.reviewId == null || widget.reviewId == '')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    (_model.textController.text !=
                                                    '') &&
                                            (_model
                                                .uploadedFileUrls_uploadDataT3s
                                                .isNotEmpty)
                                        ? '150'
                                        : '50',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'ko',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'vtwwprbe' /* P  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'ko',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '4ixjc0ax' /* / 150P */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'ko',
                                          color: Color(0xFF009F6B),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if ((_model.uploadedFileUrls_uploadDataT3s
                                      .isNotEmpty) ==
                                  true) {
                                await Future.delayed(
                                  Duration(
                                    milliseconds: 3000,
                                  ),
                                );
                              }
                              if (_model.reviewRef?.reference != null) {
                                await _model.reviewRef!.reference.update({
                                  ...createReviewsRecordData(
                                    comment: _model.textController.text,
                                    createdAt: getCurrentTimestamp,
                                    rating: _model.ratingBarValue,
                                    commentLength: functions.getCommentLength(
                                        _model.textController.text),
                                    language: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'imageUrls': _model
                                              .uploadedFileUrls_uploadDataT3s
                                              .isNotEmpty
                                          ? _model
                                              .uploadedFileUrls_uploadDataT3s
                                          : _model.reviewRef?.imageUrls,
                                    },
                                  ),
                                });

                                await _model.productRef!.reference
                                    .update(createProductsRecordData(
                                  avgRating: functions.calculateUpdatedAverage(
                                      _model.productRef!.avgRating,
                                      _model.productRef!.reviewCount,
                                      _model.reviewRef!.rating,
                                      _model.ratingBarValue!),
                                ));

                                context.goNamed(
                                  MypageWidget.routeName,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                var reviewsRecordReference =
                                    ReviewsRecord.createDoc(functions
                                        .productRef(widget.productId!));
                                await reviewsRecordReference.set({
                                  ...createReviewsRecordData(
                                    userId: currentUserReference?.id,
                                    userName: currentUserDisplayName,
                                    rating: _model.ratingBarValue,
                                    comment: _model.textController.text,
                                    createdAt: getCurrentTimestamp,
                                    orderId: widget.orderId,
                                    productId: widget.productId,
                                    commentLength: functions.getCommentLength(
                                        _model.textController.text),
                                    language: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'imageUrls':
                                          _model.uploadedFileUrls_uploadDataT3s,
                                    },
                                  ),
                                });
                                _model.createReview =
                                    ReviewsRecord.getDocumentFromData({
                                  ...createReviewsRecordData(
                                    userId: currentUserReference?.id,
                                    userName: currentUserDisplayName,
                                    rating: _model.ratingBarValue,
                                    comment: _model.textController.text,
                                    createdAt: getCurrentTimestamp,
                                    orderId: widget.orderId,
                                    productId: widget.productId,
                                    commentLength: functions.getCommentLength(
                                        _model.textController.text),
                                    language: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'imageUrls':
                                          _model.uploadedFileUrls_uploadDataT3s,
                                    },
                                  ),
                                }, reviewsRecordReference);

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'total_points': FieldValue.increment((_model.textController.text !=
                                                      '') &&
                                              (_model
                                                  .uploadedFileUrls_uploadDataT3s
                                                  .isNotEmpty)
                                          ? 150
                                          : 50),
                                    },
                                  ),
                                });

                                await PointsRecord.createDoc(
                                        currentUserReference!)
                                    .set(createPointsRecordData(
                                  type: 'review',
                                  orderId: widget.orderId,
                                  createdAt: getCurrentTimestamp,
                                  amount: (_model.textController.text !=
                                                  '') &&
                                          (_model.uploadedFileUrls_uploadDataT3s
                                              .isNotEmpty)
                                      ? 150
                                      : 50,
                                  reviewId: _model.createReview?.reference.id,
                                  productId: widget.productId,
                                ));

                                await _model.productRef!.reference.update({
                                  ...createProductsRecordData(
                                    avgRating: functions.calculateNewAverage(
                                        _model.productRef!.avgRating,
                                        _model.productRef!.reviewCount,
                                        _model.ratingBarValue!),
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'reviewCount': FieldValue.increment(1),
                                    },
                                  ),
                                });

                                context.goNamed(
                                  MypageWidget.routeName,
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
                              'butpdus4' /* 리뷰 등록 */,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF009F6B),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
