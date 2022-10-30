import 'package:flutter/material.dart';
import 'package:bmi_calculator_app_flutter/resultpage.dart';
import 'package:bmi_calculator_app_flutter/theame.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

import 'services/firebase.dart';

class BmiPage extends StatefulWidget {
  @override
  _BmiPageState createState() => _BmiPageState();
}

class CommonWebView extends StatelessWidget {
  String url;
  CommonWebView(this.url);

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter WebView example'),
        ),
        body: Builder(builder: (BuildContext context) {
          return WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                print('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }
              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
          );
        }));
  }
}

class _BmiPageState extends State<BmiPage> {
  int age = 17;
  int weight = 50;

  int height = 180;
  double maxHeight = 220;
  double minHeight = 120;

  // launchURL() async {
  //   String url = 'https://buy.stripe.com/test_bIY28A98F42AaxWbII';
  //   //const url = 'https://google.com';
  //   if (await canLaunch(url)) {
  //     await launch(url, forceWebView: true);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  inform() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CommonWebView('https://buy.stripe.com/test_bIY28A98F42AaxWbII')));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondary,
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("新天鵝堡"),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height*0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primary),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/Castle.jpg',
                        height: 200.0,
                        width: 300.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('天鵝堡專案', style: headlines)
                    ],
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              inform();
            },
            child: Container(
              color: primaryButtonColor,
              margin: EdgeInsets.only(top: 10.0),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Text('買入場券！', style: primaryButtonStyle),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              print("123");
              print(FireBase().country);
              Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => ResultPage(
                  height: height,
                  weight: weight,
                )));
          },
            child: Container(
              color: primaryButtonColor,
              margin: EdgeInsets.only(top: 10.0),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Text('買車票！', style: primaryButtonStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
