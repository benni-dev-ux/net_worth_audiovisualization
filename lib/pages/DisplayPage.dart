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

class _DisplayPageState extends State<DisplayPage>
    with SingleTickerProviderStateMixin {
  AnimationController RotationController;
  AudioCache cache;
  AudioPlayer player;

  void _playMoneySound(int duration) async {
    print('Runnining for ' + duration.toString() + ' milliseconds');
    RotationController.forward();
    // Start Audio file and stop after duration

     player =
    await cache.loop('coinsound.mp3'); // assign player here
    await Future.delayed(Duration(milliseconds: duration));
    player?.stop();
  }

  @override
  void initState() {
    cache = new AudioCache();
    super.initState();
  }

  @override
  void dispose() {
    RotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int duration = ModalRoute
        .of(context)
        .settings
        .arguments;
    RotationController =
        AnimationController(
            vsync: this, duration: Duration(milliseconds: duration));
    print('Duration is ' + duration.toString());
    _playMoneySound(duration);
    double durationInSeconds = duration / 1000;

    String timeToDisplay = durationInSeconds.toStringAsFixed(2) + " seconds";
    if (durationInSeconds > 60) {
      int min = (durationInSeconds / 60).floor();
      int seconds = (durationInSeconds - (min * 60)).round();
      timeToDisplay =
          min.toString() + " minutes " + seconds.toString() + " seconds";
    }

    int amount = (duration * 3.6).floor();

    return Scaffold(
      body: Container(
        color: kBackgroundColorDark,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 64.0, 32.0, 80.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(42.0, 16.0, 42.0, 16.0),
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(
                        RotationController),
                    child: Image.asset("assets/dollar4.png"),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  "It takes Jeff ",
                  style: kMainTextStyle,
                ),
                Text(
                  timeToDisplay,
                  textAlign: TextAlign.center,
                  style: kTimeDisplayTextStyle,
                ),
                Text(
                  "to earn \$" + amount.toString(),
                  style: kMainTextStyle,
                ),
                SizedBox(
                  height: 22.0,
                ),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    color: kAccentTwo,
                    child: Text(
                      "Back",
                      style: kMainButtonStyle,
                    ),
                    onPressed: () => {
                      player.stop(),
                      Navigator.pop(context)},
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
