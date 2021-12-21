import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AshyqView extends StatefulWidget {
  final String? iin;
  final String? bin;

  const AshyqView({this.iin, this.bin});

  @override
  State<AshyqView> createState() => _AshyqViewState();
}

class _AshyqViewState extends State<AshyqView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int levelClock = 300;
  double opacityLevel = 0.0;
  late Timer _timer;

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: levelClock),
      vsync: this,
    );

    _controller.forward();
    _timer = Timer.periodic(Duration(seconds:1), (timer) {
      setState((){
        opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xf2f2f2f2f2),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.red,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/ashyq.png',
              height: 20,
              width: 20,
            ),
            Flexible(
              child: Text('ASHYQ. Коронавирус бойынша ста',
                  maxLines: 1, style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    AnimatedOpacity(
                      // curve: Curves.elasticOut,
                      duration: Duration(seconds: 1),
                      opacity: opacityLevel,
                      child: Text(
                        "Қауіпсіз",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Text(
                      "Шектеу жоқ, вакцина салдырған, ауырып жазылған немесе ПТР-тест теріс",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(""),
                    Text(
                      "Статус 23.11.2022 дейін жарамды",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                color: Colors.green,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: <Widget>[
                    Countdown(
                      animation: StepTween(
                        begin: levelClock, // THIS IS A USER ENTERED NUMBER
                        end: 0,
                      ).animate(_controller),
                    ),
                    // Text(
                    //   "4:58,3",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 24,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    Text(
                      "ішінде сіз кіре аласыз",
                      style: TextStyle(fontSize: 18),
                    ),
                    // Text("${this.widget.iin ?? '32'}")
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Column(
                  children: [
                    Text(
                      "ЖСН",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      "${this.widget.iin ?? '121232000000'}",
                      style: TextStyle(fontSize: 18),
                    ),
                    // Text("${this.widget.iin ?? '32'}")
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                color: Color(0xf2f2f2f2f2),
                height: 2.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Column(
                  children: [
                    Text(
                      "Ұйымның ЖСН/БСН",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      "${this.widget.bin ?? '123123123123'}",
                      style: TextStyle(fontSize: 18),
                    ),
                    // Text("${this.widget.iin ?? '32'}")
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
              ),
              Container(height: 20.0),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: Text("Бас бетке оралу",
                    style: TextStyle(color: Colors.white)),
              )
            ],
          ),
          // Container(child: Column(
          //   children: [
          //     Countdown(
          //       animation: StepTween(
          //         begin: levelClock, // THIS IS A USER ENTERED NUMBER
          //         end: 0,
          //       ).animate(_controller),
          //     ),
          //   ],
          // ),)
        ],
      ),
    );
  }
}

var random = Random();

class Countdown extends AnimatedWidget {
  Countdown({required this.animation}) : super(listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')},${random.nextInt(10)}';
    if (clockTimer.inSeconds == 0) {
      Navigator.pop(context);
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    }
    // print('animation.value  ${animation.value} ');
    // print('inMinutes ${clockTimer.inMinutes.toString()}');
    // print('inSeconds ${clockTimer.inSeconds.toString()}');
    return Text(
      "$timerText",
      style: TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
