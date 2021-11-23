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
  AudioCache cache;

  void _playMoneySound(int duration) async {
    print('Runnining for ' + duration.toString() + ' milliseconds');

    // Start Audio file and stop after duration

    AudioPlayer player = await cache.loop('coinsound.mp3'); // assign player here
    await Future.delayed(Duration(milliseconds: duration));
    player?.stop();
  }

  @override
  void initState() {
    cache = new AudioCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int duration = ModalRoute.of(context).settings.arguments;
    print('Duration is ' + duration.toString());
    _playMoneySound(duration);
    double durationInSeconds = duration / 1000;

    String timeToDisplay = durationInSeconds.toStringAsFixed(2) + "seconds";
    if (durationInSeconds > 60) {
      int min = (durationInSeconds / 60).floor();
      int seconds = (durationInSeconds - (min * 60)).round();
      timeToDisplay =
          min.toString() + " minutes " + seconds.toString() + " seconds";
    }

    int amount = (duration * 3.6).floor();
    double turns = duration / 1000;

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
                AnimatedRotation(
                    turns: (5),
                    duration: new Duration(milliseconds: duration),
                    child: Image.asset("assets/dollar.png")),
                Text(
                  "It Takes Jeff ",
                  style: kMainTextStyle,
                ),
                Text(
                  timeToDisplay,
                  textAlign: TextAlign.center,
                  style: kTimeDisplayTextStyle,
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

class AnimatedRotationWidget extends StatelessWidget {
  const AnimatedRotationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/dollar.png");
  }
}
