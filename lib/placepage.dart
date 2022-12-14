import 'package:flutter/material.dart';
import 'package:bmi_calculator_app_flutter/theame.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'secondpage.dart';
import 'seconddiscountpage.dart';

class PlacePage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
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
  // final String country;
  // HomePage(this.country);
  TextEditingController refCodeController = new TextEditingController();
  StatefulWidget NavigateToDifferentPricePageByReferralCode(){
    print(refCodeController.text);
    if(refCodeController.text == 'BTS888'){
      return SecondDiscountPage();
    }
    else{
      return SecondPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 使空白處可以點擊
      behavior: HitTestBehavior.translucent,
      // 點擊後失去當前的Focus(request一個空的Focus給它)
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        refCodeController.clear();
      },
      //列表元件
      child: ListView(
        //padding: const EdgeInsets.all(8),
        children: <Widget>[
          Image.asset(
              'images/BTS.png',
              fit: BoxFit.fill,
          ),
          TextFormField(
            controller: refCodeController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '輸入：折扣碼',
            ),
          ),
          // Text(
          //     '從巴黎到聖米歇爾山，讓你直達不轉車 !!',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(height:2, fontSize: 22, fontWeight: FontWeight.bold)
          // ),
          // ListTile(
          //   title: Text(
          //     '尼斯郵輪半日遊/',
          //     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
          //   ),
          //   subtitle: Text('20221225'),
          //   leading: Icon(
          //     Icons.location_on,
          //     color: HexColor("069d94"),
          //   ),
          // ),
          // Text(
          //     '車票資訊',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(height:2, fontSize: 20, fontWeight: FontWeight.bold)
          // ),
          // Text(
          //     '巴黎 Paris Pont de Levallois → FlixBus 巴士 → 聖米歇爾山 Mont Saint-Michel',
          //     textAlign: TextAlign.start,
          //     style: TextStyle(height:1.5, fontSize: 15)
          // ),
          // Text(
          //     '車程： 4.5小時',
          //     textAlign: TextAlign.start,
          //     style: TextStyle(height:1.5, fontSize: 15)
          // ),
          // Text(
          //     '票價：€249.99',
          //     textAlign: TextAlign.start,
          //     style: TextStyle(height:1.5, fontSize: 15)
          // ),
          // Text(
          //     '巴黎聖米歇爾山是法國最受歡迎的景點之一，1979年被聯合國教科文組織列入世界文化遺產，更因為魔戒一片而聲名大造，除了是電影觀光勝地之外，同時也是天主教的朝聖地！',
          //     textAlign: TextAlign.start,
          //     style: TextStyle(height:1.5, fontSize: 15)
          // ),
          Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Wrap (
                    spacing: 20,
                    children: <Widget>[
                      ElevatedButton(
                        child: Text('其他景點'),
                        onPressed: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommonWebView('https://germany-swan-bts.github.io/suggestion')));
                        },
                      ),
                      ElevatedButton(
                        child: Text('立刻購買'),
                        onPressed: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NavigateToDifferentPricePageByReferralCode()));
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
          title: const Text('POIs'),
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


