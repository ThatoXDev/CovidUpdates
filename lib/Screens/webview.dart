import 'dart:async';

import 'package:covid_updates/Models/news.model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Webview extends StatefulWidget {
  @override
  Article article;
  Webview(this.article);
  _WebviewState createState() => _WebviewState();
}


class _WebviewState extends State<Webview> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    print(widget.article.url);
    
    return Scaffold(
      appBar: AppBar(title: Text(widget.article.title),),
      body: SafeArea(
          child: WebView(
            initialUrl: widget.article.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
      ),
    ),
    
    );
  }
  
}