import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreenForStudy extends StatefulWidget {
  const HomeScreenForStudy({super.key});

  @override
  State<HomeScreenForStudy> createState() => _HomeScreenForStudyState();
}

class _HomeScreenForStudyState extends State<HomeScreenForStudy> {
  static const int twentyFiveMinutes = 1500;

  int totalSec = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSec == 0) {
      setState(() {
        totalPomodoros += 1;
        isRunning = false;
        totalSec = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSec -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onReset() {
    timer.cancel();
    setState(() {
      if (isRunning) {
        isRunning = false;
      }
      totalSec = twentyFiveMinutes;
    });
  }

  String format(int sec) {
    var duration = Duration(seconds: sec);
    return (duration.toString().split(".").first.substring(2, 7));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSec),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
        Flexible(
            flex: 3,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    iconSize: 110,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline)),
                IconButton(
                    iconSize: 70,
                    color: Theme.of(context).cardColor,
                    onPressed: onReset,
                    icon: Icon(Icons.restore)),
              ],
            ))),
        Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pomodoros",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.color,
                            ),
                          ),
                          Text(
                            '$totalPomodoros',
                            style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.color,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ))
      ],
    ));
  }
}
