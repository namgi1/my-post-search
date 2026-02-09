// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tosspayments_widget_sdk_flutter/model/tosspayments_url.dart'; // 앱 스킴 실행용

class TossPaymentsWebView extends StatefulWidget {
  final String checkoutUrl;
  final double? width;
  final double? height;

  const TossPaymentsWebView({
    Key? key,
    required this.checkoutUrl,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _TossPaymentsWebViewState createState() => _TossPaymentsWebViewState();
}

class _TossPaymentsWebViewState extends State<TossPaymentsWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            final uri = Uri.parse(request.url);

            // -----------------------------
            // 앱 스킴 / 딥링크 처리
            // -----------------------------
            final appScheme = ConvertUrl(request.url);
            if (appScheme.isAppLink()) {
              // 앱 스킴 호출 (iOS/Android WebView에서 앱 실행)
              appScheme.launchApp();

              // 앱 스킴 URL은 WebView에서 로드 막기
              return NavigationDecision.prevent;
            }

            // -----------------------------
            // 일반 웹 URL은 그대로 로드
            // -----------------------------
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutUrl));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: WebViewWidget(controller: _controller),
    );
  }
}
