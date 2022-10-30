import 'package:flutter/material.dart';
import 'package:bmi_calculator_app_flutter/theame.dart';

class PlacePage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  // String country = '';
  //
  // changeCountry(_country) {
  //   setState(() {
  //     country = _country;
  //   });
  // }

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
          body: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  // final String country;
  // HomePage(this.country);

  //列表集合資料
  List<Widget> listview = <Widget>[
    Image.asset(
      'images/Castle.jpg',
      fit: BoxFit.fill
    ),
    Text(
        '你買票了沒 ???',
        textAlign: TextAlign.center,
        style: TextStyle(height:2, fontSize: 25, fontWeight: FontWeight.bold)
    ),
    ListTile(
      title: Text(
        '尼斯郵輪半日遊/',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      subtitle: Text('20221225'),
      leading: Icon(
        Icons.location_on,
        color: HexColor("069d94"),
      ),
    ),
    Text(
        '車票資訊',
        textAlign: TextAlign.center,
        style: TextStyle(height:2, fontSize: 15, fontWeight: FontWeight.bold)
    ),
    Column(
        children: <Widget>[
          ElevatedButton(
            child: Text('立刻購買'),
            onPressed: () {
              //changeCountry('country');
            },
          ),
        ]
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      //列表元件
      child: ListView(
        //padding: const EdgeInsets.all(8),
        children: listview,
      ),
    );
  }
}
