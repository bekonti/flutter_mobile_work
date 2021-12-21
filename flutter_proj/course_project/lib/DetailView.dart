import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Editor'),
      ),
      body: Text('hahaha'),
    );
  }
}
