import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;

  WebViewContainer(this.url);

  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();

  _WebViewContainerState(this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _url))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
    BottomNavigationBarItem(icon: Icon(Icons.add_a_photo),title: const Text('take a screenshot')),
    BottomNavigationBarItem(icon: Icon(Icons.mic),title: const Text('talk')),
    BottomNavigationBarItem(icon: Icon(Icons.camera_roll),title: const Text('record video'))
    ],

    //onTap: (int i) => _index(i),
    ),
    );

  }
  void _goBackToFirstScreen(BuildContext context) {
    Navigator.pop(context);
  }
}