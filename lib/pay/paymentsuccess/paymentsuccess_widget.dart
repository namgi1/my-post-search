import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'paymentsuccess_model.dart';
export 'paymentsuccess_model.dart';

class PaymentsuccessWidget extends StatefulWidget {
  const PaymentsuccessWidget({
    super.key,
    required this.orderId,
  });

  final String? orderId;

  static String routeName = 'paymentsuccess';
  static String routePath = '/paymentsuccess';

  @override
  State<PaymentsuccessWidget> createState() => _PaymentsuccessWidgetState();
}

class _PaymentsuccessWidgetState extends State<PaymentsuccessWidget> {
  late PaymentsuccessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentsuccessModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.paymentsuccess = await OrdersRecord.getDocumentOnce(
          functions.orderRef(currentUserUid, widget.orderId!));
      if (_model.paymentsuccess?.status == 'paid') {
        await PointsRecord.createDoc(currentUserReference!)
            .set(createPointsRecordData(
          type: 'earned',
          orderId: widget.orderId,
          createdAt: getCurrentTimestamp,
          amount: functions.calculatePoints(_model.paymentsuccess!.totalAmount),
        ));

        await currentUserReference!.update({
          ...mapToFirestore(
            {
              'total_points': FieldValue.increment(functions
                  .calculatePoints(_model.paymentsuccess!.totalAmount)),
            },
          ),
        });
        if (_model.paymentsuccess?.pointDiscount != null) {
          await currentUserReference!.update({
            ...mapToFirestore(
              {
                'total_points':
                    FieldValue.increment(_model.paymentsuccess!.pointDiscount),
              },
            ),
          });

          await PointsRecord.createDoc(currentUserReference!)
              .set(createPointsRecordData(
            type: 'used',
            orderId: widget.orderId,
            createdAt: getCurrentTimestamp,
            amount: _model.paymentsuccess?.pointDiscount,
          ));
        }
        if (_model.paymentsuccess?.couponRef != null) {
          await _model.paymentsuccess!.couponRef!
              .update(createCouponsRecordData(
            isUsed: true,
            usedAt: getCurrentTimestamp,
            orderId: widget.orderId,
          ));
        }

        context.goNamed(
          OrderDetailWidget.routeName,
          queryParameters: {
            'orderId': serializeParam(
              widget.orderId,
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      ),
    );
  }
}
