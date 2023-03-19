import 'package:flutter/material.dart';
import 'package:fragileitemtrackingapp/models/user_model.dart';
import 'package:fragileitemtrackingapp/providers/user_provider.dart';
import 'package:fragileitemtrackingapp/services/auth_methods.dart';
import 'package:provider/provider.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  _NewHomeScreenState createState() => _NewHomeScreenState();
}

var _textStyleblack = const TextStyle(fontSize: 12.0, color: Colors.black);

class _NewHomeScreenState extends State<NewHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('FragileAT'),
          backgroundColor: Colors.green
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            ],
          )),
    );
  }
}