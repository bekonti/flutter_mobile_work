import 'package:course_project/DetailView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('List'),
      ),
      body:  SingleChildScrollView(
        child: Container(
          child: Card(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Row(children: <Widget>[
                          Text(
                            'test',
                            style: new TextStyle(fontSize: 30.0),
                          ),
                          Spacer(),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 80.0),
                        child: Row(children: <Widget>[
                          Spacer(),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          children: <Widget>[
                            Spacer(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailView()),
                  );
                },
              )),
        ),
      ),
    );

  }
}