import 'package:e_commerce/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisaWebView extends StatefulWidget {
  const VisaWebView({super.key});

  @override
  State<VisaWebView> createState() => _VisaWebViewState();
}

class _VisaWebViewState extends State<VisaWebView> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(
        'https://accept.paymob.com/api/acceptance/iframes/808015?payment_token=$requestTokenCard'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visa'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
