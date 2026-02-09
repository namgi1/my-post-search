import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'quantity_model.dart';
export 'quantity_model.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({
    super.key,
    this.cartItemDoc,
    this.initialQuantity,
  });

  final CartItemsRecord? cartItemDoc;
  final int? initialQuantity;

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  late QuantityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuantityModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.quantity = widget.initialQuantity;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await widget.cartItemDoc!.reference.update(createCartItemsRecordData(
            quantity: _model.quantity,
            subtotal: widget.cartItemDoc!.discountedPrice * (_model.quantity!),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            border: Border.all(
              color: Color(0xFFB4B4B8),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (_model.quantity! > 1) {
                      _model.quantity = (_model.quantity!) - 1;
                      safeSetState(() {});

                      await widget.cartItemDoc!.reference
                          .update(createCartItemsRecordData(
                        quantity: _model.quantity,
                        subtotal: widget.cartItemDoc!.discountedPrice *
                            (_model.quantity!),
                      ));
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    _model.quantity?.toString(),
                    '1',
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'ko',
                        letterSpacing: 0.0,
                      ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.quantity = (_model.quantity!) + 1;
                    safeSetState(() {});

                    await widget.cartItemDoc!.reference
                        .update(createCartItemsRecordData(
                      quantity: _model.quantity,
                      subtotal: widget.cartItemDoc!.discountedPrice *
                          (_model.quantity!),
                    ));
                  },
                  child: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
