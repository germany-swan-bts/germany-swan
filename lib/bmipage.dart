import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bmi_calculator_app_flutter/resultpage.dart';
import 'package:bmi_calculator_app_flutter/theame.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

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
    var client  =  GrailApiClient(
        httpClient: http.Client(),
        baseUrl: "http://alpha.api.g2rail.com",
        apiKey: "fa656e6b99d64f309d72d6a8e7284953",
        secret: "9a52b1f7-7c96-4305-8569-1016a55048bc");
    var asyncKey = client.getSolutions("BERLIN", "FRANKFURT", "2022-10-31", "10:00", 1, 0);
    print(asyncKey);

    return Container(
      color: secondary,
      child: Column(
        children: <Widget>[
          AppBar(
            // title: Text("新天鵝堡"),
            title: Text(asyncKey.toString()),
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
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                      height: height,
                      weight: weight,
                    ))),
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

class SearchCriteria {
  String from;
  String to;
  String date;
  String time;
  int adult;
  int child;

  SearchCriteria(from, to, date, time, adult, child) {
    this.from = from;
    this.to = to;
    this.date = date;
    this.time = time;
    this.adult = adult;
    this.child = child;
  }

  String toQuery() {
    return "from=$from&to=$to&date=$date&time=$time&adult=$adult&child=$child";
  }

  Map<String, dynamic> toMap() {
    return {
      "from": from,
      "to": to,
      "date": date,
      "time": time,
      "adult": adult,
      "child": child
    };
  }
}

class GrailApiClient {
  final baseUrl;
  final apiKey;
  final secret;
  final http.Client httpClient;

  GrailApiClient({@required this.httpClient,
    @required this.baseUrl,
    @required this.apiKey,
    @required this.secret})
      : assert(httpClient != null);


  Map<String, String> getAuthorizationHeaders(Map<String, dynamic> params) {
    var timestamp = DateTime.now();
    params['t'] = (timestamp.millisecondsSinceEpoch ~/ 1000).toString();
    params['api_key'] = apiKey;

    var sortedKeys = params.keys.toList()
      ..sort((a, b) => a.compareTo(b));
    StringBuffer buffer = StringBuffer("");
    sortedKeys.forEach((key) {
      if (params[key] is List || params[key] is Map) return;
      buffer.write('$key=${params[key].toString()}');
    });
    buffer.write(secret);

    String hashString = buffer.toString();
    String authorization = md5.convert(utf8.encode(hashString)).toString();

    return {
      "From": apiKey,
      "Content-Type": 'application/json',
      "Authorization": authorization,
      "Date": HttpDate.format(timestamp),
      "Api-Locale": "zh-TW"
    };
  }

  Future<dynamic> getSolutions(from, to, date, time, adult, child) async {
    final criteria = SearchCriteria(from, to, date, time, adult, child);
    final solutionUrl =
        '$baseUrl/api/v2/online_solutions/?${criteria.toQuery()}';

    final solutionResponse = await this
        .httpClient
        .get(Uri.parse(solutionUrl), headers: getAuthorizationHeaders(criteria.toMap()));

    if (solutionResponse.statusCode != 200) {
      throw Exception('error getting solutions');
    }

    final solutionsJson = jsonDecode(solutionResponse.body);

    return solutionsJson;
  }

  Future<dynamic> getAsyncResult(String asyncKey) async {
    final asyncResultURl = '$baseUrl/api/v2/async_results/$asyncKey';
    final asyncResult = await this.httpClient.get(Uri.parse(asyncResultURl),
        headers: getAuthorizationHeaders({"async_key": asyncKey}));
    return {"data": jsonDecode(utf8.decode(asyncResult.bodyBytes))};
  }
}

class G2RailSearchResponse{
  List<Schedule> schedules;
}

class Schedule
{
  Railway railway;
  bool loading;
  List<Solution> solutions;
}

class Railway
{
  String code;
}

class Solution
{
  Location from;
  Location to;
  DateTime departure;
  TimeInfo duration;
  int transfer_times;
  List<Section> sections;
}

class Location
{
  String code;
  String name;
  Uri help_url;
}

class TimeInfo
{
  int hour;
  int minutes;
}

class Section
{
  String carrier_description;
  String carrier_code;
  List<Offer> offers;
  List<Train> trains;
}

class Offer
{
  String code;
  String description;
  String ticket_type;
  String seat_type;
  String refund_type;
  String change_type;
  String confirm_again;
  String detail;
  Restriction restriction;
  List<Service> services;
}

class Restriction
{
  String code;
  String description;
  String detail;
}

class Service
{
  String code;
  String description;
  String detail;
  SeatInfo available;
  Money price;
  String booking_code;
  String booking_type;
}

class SeatInfo
{
  int seats;
}

class Money
{
  String currency;
  int cents;
}

class Train
{
  String number;
  String seat_type;
  Location from;
  Location to;
  DateTime departure;
  DateTime arrival;
  Uri help_url;
  List<Location> stops;
}