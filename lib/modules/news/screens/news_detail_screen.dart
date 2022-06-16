import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  final String newsUrl;
  const WebviewScreen({
    Key? key,
    required this.newsUrl,
  }) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewController webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Berita",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              webViewController.reload();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.newsUrl,
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        navigationDelegate: (NavigationRequest request) {
          return NavigationDecision.prevent;
        },
      ),
    );
  }
}
