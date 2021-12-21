import 'package:course_project/navigation.dart';
import 'package:course_project/qrScan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AshyqView.dart';

void main() => runApp(const MaterialApp(home: CourseApp()));

class CourseApp extends StatefulWidget {
  const CourseApp({Key? key}) : super(key: key);

  @override
  _CourseAppState createState() => _CourseAppState();
}

class _CourseAppState extends State<CourseApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ashyq',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Row( mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('                 '),
              Image.asset(
                'assets/ashyq.png',
                height: 20,
                width: 20,
              ),
              Flexible(
                child: Text('ASHYQ',
                    maxLines: 1, style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
          // Text(
          //   'Ashyq',
          //   style: TextStyle(color: Colors.white),
          // ),
          automaticallyImplyLeading: true,
        ),
        body: Scaffold(
          body: Column(
            children: [
              Container(height: 25.0),
              Text(
                'ЖСН',
                style: TextStyle(fontSize: 36),
              ),
              Card(
                child: TextFormField(
                  initialValue: '011012501586',//'001108500745',
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(height: 20.0),
              Row(
                children: [
                  Container(width: 15.0),
                  Text(
                    'Қолданушылар үшін',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QRScan())),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white24,
                    fixedSize: const Size(1000, 60),
                  ),
                  child: Text(
                    'Кіру Регистрациясы',
                    style: TextStyle(fontSize: 16),
                    // textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Text(
                  'qweqwe',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Ashyq QR'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QRScan()));
                },
              ),
              // ListTile(
              //   title: Text('Onay QR'),
              //   onTap: () {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => HomeView()));
              //   },
              // ),
              // ListTile(
              //   title: Text('Editor'),
              //   onTap: () {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => AshyqView()));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
