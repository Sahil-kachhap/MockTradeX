import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String? url;
  const ArticleView({Key? key, this.url}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  late WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market News'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: const Color(0xff080c10),
        elevation: 0,
      ),
      body: Container(
        child: WebViewWidget(
          controller: WebViewController()..loadRequest(Uri.parse(widget.url!)),
          // initialUrl: widget.url,
          // onWebViewCreated: (controller){
          //   _controller=controller;
          // },
        ),
      ),
    );
  }
}
