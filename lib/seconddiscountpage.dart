import 'package:bmi_calculator_app_flutter/theame.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'placepage.dart';

class SecondDiscountPage extends StatefulWidget {
  @override
  _SecondDiscountPageState createState() => _SecondDiscountPageState();
}

class _SecondDiscountPageState extends State<SecondDiscountPage> {
  @override
  Widget build(BuildContext context) {
    print('DiscountPageShow');
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor("069d94"),
            title: Text(
              'Journey Town',
              style: TextStyle(color: HexColor("ffffff")),
            ),
          ),
          body: PageBody(),
        ));
  }
}

class PageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      //列表元件
      child: ListView(
        //padding: const EdgeInsets.all(8),
        children: <Widget>[
          Image.asset(
              'images/Castle.jpg',
              fit: BoxFit.fill
          ),
          Text(
              '特別優惠付款頁面',
              textAlign: TextAlign.center,
              style: TextStyle(height:2, fontSize: 22, fontWeight: FontWeight.bold)
          ),
          Text('付款資訊： (808) 012898232422'),
          Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Wrap (
                    spacing: 20,
                    children: <Widget>[
                      ElevatedButton(
                        child: Text('取消'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PlacePage()),);
                        },
                      ),
                      ElevatedButton(
                        child: Text('線上支付'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommonWebView('https://buy.stripe.com/test_aEUcNeesZdDabC05km')));
                        },
                      ),
                  ]
                )
              ]
          ),
        ],
      ),
    );
  }
}

class CommonWebView extends StatelessWidget {
  String url;
  CommonWebView(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment Page'),
        ),
        body: Builder(builder: (BuildContext context) {
          return WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
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
