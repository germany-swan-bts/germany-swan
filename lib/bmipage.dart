import 'package:flutter/material.dart';
import 'package:bmi_calculator_app_flutter/resultpage.dart';
import 'package:bmi_calculator_app_flutter/theame.dart';

class BmiPage extends StatefulWidget {
  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  int age = 17;
  int weight = 50;

  int height = 180;
  double maxHeight = 220;
  double minHeight = 120;

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
                      Text('MALE', style: headlines)
                    ],
                  ),
                ),
              ),
            ],
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
                child: Text('Purchase Ticket', style: primaryButtonStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
