import 'package:flutter/material.dart';
import 'package:bmi_calculator_app_flutter/theame.dart';

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
          body: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  //列表集合資料
  List<Widget> list = <Widget>[
    Image.asset(
      'images/Castle.jpg',
      fit: BoxFit.fill
    ),
    ListTile(
      title: Text(
        '德國',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      leading: Icon(
        Icons.location_on,
        color: HexColor("069d94"),
      ),
    ),
    ListTile(
      title: Text(
        '法國',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      leading: Icon(
        Icons.location_on,
        color: HexColor("069d94"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      //列表元件
      child: ListView(
        children: list,
      ),
    );
  }
}
