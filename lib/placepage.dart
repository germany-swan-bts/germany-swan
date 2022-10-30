import 'package:flutter/material.dart';
import 'package:bmi_calculator_app_flutter/theame.dart';
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

  @override
  Widget build(BuildContext context) {
    return Center(
      //列表元件
      child: ListView(
        //padding: const EdgeInsets.all(8),
        children: <Widget>[
          Image.asset(
              'images/Castle.jpg',
              fit: BoxFit.fill,
          ),
          // GestureDetector(
          //   onTap: () => {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => SecondPage()),)
          //   },
          //   child: Image.asset(
          //       'images/Castle.jpg',
          //       fit: BoxFit.fill,
          //   ),
          // ),
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
          Column(
              children: <Widget>[
                ElevatedButton(
                  child: Text('立刻購買'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondPage()),);
                  },
                ),
              ]
          ),
          Column(
              children: <Widget>[
                ElevatedButton(
                  child: Text('折扣立刻購買'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondDiscountPage()),);
                  },
                ),
              ]
          ),
        ],
      ),
    );
  }
}

