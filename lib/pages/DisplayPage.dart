import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DisplayPage extends StatefulWidget {
  DisplayPage({Key key}) : super(key: key);

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  void _playMoneySound(int duration) async {
    print('Runnining for ' + duration.toString() + ' milliseconds');

    // Start Audio file and stop after duration
    AudioCache cache = new AudioCache();
    AudioPlayer player = await cache.play('s1.mp3'); // assign player here
    await Future.delayed(Duration(milliseconds: duration));
    player?.stop();
  }

  @override
  Widget build(BuildContext context) {
    int duration = ModalRoute.of(context).settings.arguments;
    print('Duration is ' + duration.toString());
    _playMoneySound(duration);
    double durationInSeconds = duration / 1000;

    String timeToDisplay = durationInSeconds.toStringAsFixed(2) + "s";
    if(durationInSeconds>60){
      int min = (durationInSeconds/60).floor();
      int seconds =(durationInSeconds- (min*60)).round();
      timeToDisplay = min.toString()+" m "+ seconds.toString()+" s";

    }

    int amount = (duration * 3.6).round();





    return Scaffold(
      body: Container(
        color: kBackgroundColorLight,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 64.0, 32.0, 80.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "It Takes Jeff ",
                  style: kMainTextStyle,
                ),
                Text(
                  timeToDisplay,
                  textAlign: TextAlign.center,
                  style: kHeadingTextStyle,
                ),
                Text(
                  "to earn " + amount.toString() + " dollars.",
                  style: kMainTextStyle,
                ),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    color: kAccentTwo,
                    child: Text(
                      "Back",
                      style: kMainButtonStyle,
                    ),
                    onPressed: () => {Navigator.pop(context)},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
