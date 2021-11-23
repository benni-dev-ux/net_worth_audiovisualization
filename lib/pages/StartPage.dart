import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final numberInputController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    numberInputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  int calculateDuration() {
    //Get Duration from controller: default 1 second
    int dollarPerSecond = 3600;
    int numberInput = 3600;

    if (numberInputController.text.isNotEmpty)
      numberInput = int.parse(numberInputController.text);

    //calculate running time
    double dur = (numberInput / dollarPerSecond) * 1000;
    int playDuration = dur.round();

    return playDuration;
  }

  @override
  Widget build(BuildContext context) {
    int duration;
    return new Scaffold(
        body: Container(
      color: kBackgroundColorDark,
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
                "With an estimated net worth of \$211.4 billion Amazon founder Jeff Bezos is currently the second richest person on earth. Calculate how long he needs to gain your net worth.",
                style: kMainTextStyle),
            SizedBox(
              height: 22.0,
            ),
            Container(
              color: kBackgroundColorDarkContrast,
              child: new TextField(
                controller: numberInputController,
                decoration: new InputDecoration(

                  hintStyle: TextStyle(fontSize: 17, color: kTextColorlightContrast),
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
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: numberInputController,
              builder: (context, value, child) {
                return Container(
                  width: double.infinity,
                  child: MaterialButton(
                    color: kAccentTwo,
                    disabledColor: Colors.white,
                    child: Text(
                      "Calculate",
                      style: kMainButtonStyle,
                    ),
                    onPressed: () => {
                      if (value.text.isNotEmpty)
                        {
                          duration = calculateDuration(),
                          Navigator.pushNamed(context, '/Display',
                              arguments: duration)
                        }
                      else
                        {null}
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
