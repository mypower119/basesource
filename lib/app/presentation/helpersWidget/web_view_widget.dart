//import 'package:caballo/utils/base_state.dart';
//import 'package:caballo/utils/string_utils.dart';
//import 'package:flutter/material.dart';
////import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//
//class WebViewWidget extends StatefulWidget {
//  final String url;
//  final String title;
//
//  const WebViewWidget({Key key, this.url, this.title}) : super(key: key);
//
//  static Future<dynamic> navigate(BuildContext context, String url, String title) {
//    return Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewWidget(url:  url, title: title,)));
//  }
//
//  @override
//  _MyAppState createState() => new _MyAppState();
//}
//
//class _MyAppState extends BaseState<WebViewWidget> {
//  InAppWebViewController webView;
//  String url = "";
//  double progress = 0;
//  String _title;
//  double heightBottomBar = 60;
//  int _currentShow = 0;
//  int _currentY = 0;
//  bool showBottombar = true;
//
//  @override
//  void initState() {
//    print('_MyAppState.initState: url ${widget.url}');
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    bool hasTitle = isNotEmpty(widget.title);
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        elevation: 1,
//        title: hasTitle
//            ? Text(
//                widget.title,
//                style: TextStyle(fontSize: 22, color: Color(0xFF1d1d26)),
//              )
//            : Container(),
//        centerTitle: true,
//        leading: IconButton(
//            icon: Icon(
//              Icons.arrow_back_ios,
//              color: Colors.black54,
//            ),
//            onPressed: () {
//              Navigator.of(context).pop();
//            }),
//      ),
//      body: isNotEmpty(widget.url)
//          ? Container(
//              width: screenSize.width,
//              height: screenSize.height,
//              child: Stack(
//                children: <Widget>[
//                  (progress != 1.0)
//                      ? LinearProgressIndicator(value: progress)
//                      : null,
//                  Container(
//                    width: screenSize.width,
//                    height: screenSize.height,
//                    child: InAppWebView(
//                      initialUrl: widget.url,
//                      initialOptions: InAppWebViewWidgetOptions(
//                          inAppWebViewOptions: InAppWebViewOptions(
//                            debuggingEnabled: true,
//                          )
//                      ),
//                      onScrollChanged: (controller, x, y) {
//                        if (y > _currentY) {
//                          showBottombar = false;
//                          _currentY = y;
//                        }
//                        if (y < _currentY) {
//                          showBottombar = true;
//                          _currentY = y;
//                        }
//                        setState(() {});
//                      },
//                      initialHeaders: {},
//                      onWebViewCreated: (InAppWebViewController controller) {
//                        webView = controller;
//                      },
//                      onLoadStart:
//                          (InAppWebViewController controller, String url) {
//                        print("started $url");
//                        setState(() {
//                          this.url = url;
//                        });
//                      },
//                      onProgressChanged:
//                          (InAppWebViewController controller, int progress) {
//                        setState(() {
//                          this.progress = progress / 100;
//                        });
//                      },
//                    ),
//                  ),
//                  showBottombar
//                      ? Align(
//                          alignment: Alignment.bottomCenter,
//                          child: Container(
//                            width: double.infinity,
//                            height: heightBottomBar,
//                            color: Colors.white,
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceAround,
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                              children: <Widget>[
//                                GestureDetector(
//                                  onTap: () {
//                                    if (webView != null) {
//                                      webView.goBack();
//                                    }
//                                  },
//                                  child: Container(
//                                    child: Icon(
//                                      Icons.navigate_before,
//                                      color: Colors.blue,
//                                      size: 35,
//                                    ),
//                                  ),
//                                ),
//                                GestureDetector(
//                                  onTap: () {
//                                    if (webView != null) {
//                                      webView.goForward();
//                                    }
//                                  },
//                                  child: Container(
//                                    child: Icon(
//                                      Icons.navigate_next,
//                                      color: Colors.blue,
//                                      size: 35,
//                                    ),
//                                  ),
//                                ),
//                                GestureDetector(
//                                  onTap: () {
//                                    if (webView != null) {
//                                      webView.reload();
//                                    }
//                                  },
//                                  child: Container(
//                                    child: Icon(
//                                      Icons.refresh,
//                                      color: Colors.blue,
//                                      size: 30,
//                                    ),
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        )
//                      : Container(),
//                ].where((Object o) => o != null).toList(),
//              ),
//            )
//          : Center(
//              child: Text("Trang này không tồn tại"),
//            ),
//    );
//  }
//}
