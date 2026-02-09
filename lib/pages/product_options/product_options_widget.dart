import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/go_cart/go_cart_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'product_options_model.dart';
export 'product_options_model.dart';

class ProductOptionsWidget extends StatefulWidget {
  const ProductOptionsWidget({
    super.key,
    this.productRef,
    this.brandName,
    this.productName,
    this.discountedrate,
    this.price,
    this.discountedPrice,
    this.mainImage,
    required this.sellerId,
  });

  final DocumentReference? productRef;
  final String? brandName;
  final String? productName;
  final int? discountedrate;
  final int? price;
  final int? discountedPrice;
  final String? mainImage;
  final String? sellerId;

  @override
  State<ProductOptionsWidget> createState() => _ProductOptionsWidgetState();
}

class _ProductOptionsWidgetState extends State<ProductOptionsWidget> {
  late ProductOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductOptionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return double.infinity;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 600.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 600.0;
          } else {
            return 600.0;
          }
        }(),
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Icon(
                      Icons.remove,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 48.0,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.brandName,
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'ko',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.productName,
                          '0',
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'ko',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 1.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              functions
                                  .formatDiscountRate(widget.discountedrate!),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'ko',
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              functions.formatPrice(widget.price),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'ko',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            functions.formatPrice(widget.discountedPrice),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'ko',
                                  fontSize: 32.0,
                                  letterSpacing: 1.0,
                                ),
                          ),
                        ),
                        Container(
                          width: 120.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          child: FlutterFlowCountController(
                            decrementIconBuilder: (enabled) => Icon(
                              Icons.remove_rounded,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).secondaryText
                                  : FlutterFlowTheme.of(context).alternate,
                              size: 24.0,
                            ),
                            incrementIconBuilder: (enabled) => Icon(
                              Icons.add_rounded,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).secondaryText
                                  : FlutterFlowTheme.of(context).alternate,
                              size: 24.0,
                            ),
                            countBuilder: (count) => Text(
                              count.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'ko',
                                    fontSize: 18.0,
                                    letterSpacing: 8.0,
                                  ),
                            ),
                            count: _model.countControllerValue ??= 1,
                            updateCount: (count) async {
                              safeSetState(
                                  () => _model.countControllerValue = count);
                              _model.quantity = _model.countControllerValue;
                              safeSetState(() {});
                            },
                            stepSize: 1,
                            minimum: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.cartQueryResult =
                                  await queryCartItemsRecordOnce(
                                parent: currentUserReference,
                                queryBuilder: (cartItemsRecord) =>
                                    cartItemsRecord.where(
                                  'productRef',
                                  isEqualTo: widget.productRef,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              if (_model.cartQueryResult?.reference != null) {
                                await _model.cartQueryResult!.reference
                                    .update(createCartItemsRecordData(
                                  quantity: _model.countControllerValue,
                                  subtotal: (widget.discountedPrice!) *
                                      (_model.countControllerValue!),
                                ));
                              } else {
                                var cartItemsRecordReference =
                                    CartItemsRecord.createDoc(
                                        currentUserReference!);
                                await cartItemsRecordReference
                                    .set(createCartItemsRecordData(
                                  productRef: widget.productRef,
                                  quantity: _model.countControllerValue,
                                  createdAt: getCurrentTimestamp,
                                  productName: widget.productName,
                                  mainImage: widget.mainImage,
                                  brandName: widget.brandName,
                                  price: widget.price,
                                  subtotal: (widget.discountedPrice!) *
                                      (_model.countControllerValue!),
                                  discountedPrice: widget.discountedPrice,
                                  discountedRate: widget.discountedrate,
                                  sellerId: widget.sellerId,
                                ));
                                _model.addCart =
                                    CartItemsRecord.getDocumentFromData(
                                        createCartItemsRecordData(
                                          productRef: widget.productRef,
                                          quantity: _model.countControllerValue,
                                          createdAt: getCurrentTimestamp,
                                          productName: widget.productName,
                                          mainImage: widget.mainImage,
                                          brandName: widget.brandName,
                                          price: widget.price,
                                          subtotal: (widget.discountedPrice!) *
                                              (_model.countControllerValue!),
                                          discountedPrice:
                                              widget.discountedPrice,
                                          discountedRate:
                                              widget.discountedrate,
                                          sellerId: widget.sellerId,
                                        ),
                                        cartItemsRecordReference);
                              }

                              Navigator.pop(context);
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                enableDrag: false,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height: 480.0,
                                        child: GoCartWidget(
                                          productImage: widget.mainImage!,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              safeSetState(() {});
                            },
                            child: Container(
                              width: 240.0,
                              height: 56.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFF009F6B),
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '4mkhm1xa' /* 장바구니 담기 */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'ko',
                                        color: Color(0xFF009F6B),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
