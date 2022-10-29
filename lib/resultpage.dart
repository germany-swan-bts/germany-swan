import 'package:flutter/material.dart';
import 'package:bmi_calculator_app_flutter/theame.dart';


class ResultPage extends StatelessWidget {
  final int height;
  final int weight;

  ResultPage({this.height,this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('YOUR RESULT'),
    
        backgroundColor: Colors.transparent,
        leading: IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context),),
      ),
      body: Result(this.height,this.weight),
    );
  }
}


class Result extends StatefulWidget {

 final int height;
 final int weight;
 Map<String, String> map = {
   'D34F':'From Munich to Fussen | Depart->08:07 & Arrived->10:07',
   'GH4D':'From Munich to Fussen | Depart->08:20 & Arrived->10:41',
   'JFL9':'From Munich to Fussen | Depart->09:36 & Arrived->11:41',
   'HL6V':'From Munich to Fussen | Depart->10:21 & Arrived->12:41'};

  Result(this.height,this.weight);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: <Widget>[

        Expanded(

          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width *0.9,
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: primary

            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("We can only buy ticket tmr"),
                Text("From: Munich"),
                Text("To: Fussen"),
                Image.asset(
                  'images/train_schedule.jpg',
                  height: 500.0,
                  width: 500.0
                ),
                // Text("$headline",style: headlines),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Text('${bmiResult(this.widget.height, this.widget.weight)}', style: resultNumber),
                // ),
                // Column(
                //   children: <Widget>[
                //     Text('Normal BMI range:'),
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text("18.5 - 25 kg/m",style: headlines,),
                // ),
                //   ],
                // ),
                

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text('$comment', style: headlines,),
                // )
              ],
            ),
          ),        
        ),

        InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                color: primaryButtonColor,
                margin: EdgeInsets.only(top: 10.0),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: Text('Buy', style: primaryButtonStyle),
                  ),
             ),
           ),


      ],
    );
  }
}
var comment = '';
var headline = '';
bmiResult(h,w){
  double bmi = (w/(h*h))*10000;
  if(bmi<18.5){
    comment = "You are under Weight";
    headline = "UNDERWEIGHT";
  }else if(bmi >= 18.5 && bmi <25){
    comment = "You are at a healthy weight.";
    headline = "NORMAL";
  }else if(bmi > 25 && bmi <= 29.99){
    comment = "You are at overweight.";
    headline = "OVERWEIGHT";
  }else{
    comment = "You are obese.";
    headline = "OBESE";
  }

  return bmi.round();
}
