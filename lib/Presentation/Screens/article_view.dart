import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String? url;
  const ArticleView({Key? key,this.url}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  late WebViewController _controller;
  double progress=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market News'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            _controller.reload();
          }, icon: Icon(Icons.refresh_outlined)),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
             Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: Color(0xff080c10),
        elevation: 0,
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            color:Color(0xffefba08),
            backgroundColor: Color(0xff080c10),
          ),
          Expanded(
            child: WebView(
              initialUrl: widget.url,
              onProgress: (progress){
                setState(() {
                  this.progress=progress/100;
                });
              },
              onWebViewCreated: (controller){
                _controller=controller;
              },

            ),
          ),
        ],
      ),
    );
  }
}
