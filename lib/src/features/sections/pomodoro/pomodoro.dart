import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/widgets/custom_app_bar.dart';
import 'package:newfocus_v2/src/widgets/days_header.dart';

class PomodoroScreen extends StatefulWidget {
  @override
  _PomodoroScreenState createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  int focusDuration = 20;
  int breakDuration = 5;
  bool isRunning = false;
  bool isFocusMode = true;
  int _minutesLeft = 0;
  int _secondsLeft = 0;
  Timer? _timer;
  late final String? displayName;
  final User? user = FirebaseAuth.instance.currentUser;
  int breakCount = 0;

  @override
  void initState() {
    super.initState();
    _minutesLeft = focusDuration;
    _secondsLeft = 0;
  }

  void startTimer() {
    setState(() {
      isRunning = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_minutesLeft == 0 && _secondsLeft == 0) {
        if (isFocusMode) {
          _minutesLeft = breakDuration;
          _secondsLeft = 0;
          isFocusMode = false;
          breakCount++;
        } else {
          _minutesLeft = focusDuration;
          _secondsLeft = 0;
          isFocusMode = true;
        }
        setState(() {
          isRunning = false;
        });
      } else if (_secondsLeft == 0) {
        setState(() {
          _minutesLeft--;
          _secondsLeft = 59;
        });
      } else {
        setState(() {
          _secondsLeft--;
        });
      }
    });
  }

  void pauseTimer() {
    setState(() {
      isRunning = false;
    });
    _timer?.cancel();
  }

  String getModeTitle() {
    return isFocusMode ? 'FOCUS' : 'BREAK';
  }

  IconData getPauseIcon() {
    return isRunning ? Icons.pause : Icons.play_arrow;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GreetingWidget(
                displayName: user?.displayName,
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 50),
                    const Text(
                      'Metodo Pomodoro',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: isFocusMode ? 'Estudio: ' : 'Descanso: ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: isFocusMode
                                  ? Pallete.customColor1
                                  : Pallete.appBarFocus,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' ${isFocusMode ? focusDuration : breakDuration} minutos',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? const Color.fromRGBO(28, 28, 31, 1)
                                  : const Color.fromARGB(255, 247, 236, 252),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.1,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 3,
                              color: Pallete.borderColor1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              _minutesLeft.toString().padLeft(2, '0'),
                              style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          ':',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w400,
                            color: Pallete.borderColor1,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.1,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 3,
                              color: Pallete.borderColor1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              _secondsLeft.toString().padLeft(2, '0'),
                              style: const TextStyle(
                                  fontSize: 60, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Pallete.borderColor1,
                        ),
                        borderRadius: BorderRadius.circular(10000),
                      ),
                      child: IconButton(
                        onPressed: isRunning ? pauseTimer : startTimer,
                        icon: Icon(getPauseIcon()),
                        iconSize: 40.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Breaks: ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Pallete.customColor1,
                            ),
                          ),
                          TextSpan(
                            text: '$breakCount',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? const Color.fromRGBO(28, 28, 31, 1)
                                  : const Color.fromARGB(255, 247, 236, 252),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
