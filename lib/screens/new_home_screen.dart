import 'package:firebase_database/firebase_database.dart';
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
    String angleX = "";
    String angleY = "";
    String angleZ = "";

  @override
  void initState() {
    super.initState();
DatabaseReference refX = FirebaseDatabase.instance.ref("gyro/anglex");
DatabaseReference refY = FirebaseDatabase.instance.ref("gyro/angley");
DatabaseReference refZ = FirebaseDatabase.instance.ref("gyro/anglez");
    refX.onValue.listen((DatabaseEvent event){
      setState(() {
      angleX = event.snapshot.value.toString();
      });
      
    });
     refY.onValue.listen((DatabaseEvent event){
      setState(() {
      angleY = event.snapshot.value.toString();
      });
      
    });
     refZ.onValue.listen((DatabaseEvent event){
      setState(() {
      angleZ = event.snapshot.value.toString();
      });
      
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              Text('angleX $angleX', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              Text('angleY $angleY', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              Text('angleZ $angleZ', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            ],
          )),
    );
  }
}