import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      color: kBackgroundColorLight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 64.0, 32.0, 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("How long does it take Jeff Bezos to gain your net worth?",
                style: kHeadingTextStyle),
            SizedBox(
              height: 12.0,
            ),
            Text(
                "Enter your net worth and hear how long it takes for Jeff to earn the same amount",
                style: kMainTextStyle),
            SizedBox(
              height: 22.0,
            ),
            Container(
              color: kBackgroundColorDark,
              child: new TextField(
                decoration: new InputDecoration(
                  hintStyle: TextStyle(fontSize: 17, color: kTextColorDark),
                  hintText: 'Enter an amount',
                  suffixIcon: Icon(Icons.money_sharp),
                  contentPadding: EdgeInsets.all(20),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              color: kAccentTwo,
              width: double.infinity,
              child: MaterialButton(
                child: Text(
                  "Calculate",
                  style: kMainButtonStyle,
                ),
                onPressed: () => {print("Button pressed")},
              ),
            ),
          ],
        ),
      ),
    ));
  }
}