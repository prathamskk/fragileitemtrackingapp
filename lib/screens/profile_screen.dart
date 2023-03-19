import 'package:flutter/material.dart';
import 'package:fragileitemtrackingapp/models/user_model.dart';
import 'package:fragileitemtrackingapp/providers/user_provider.dart';
import 'package:fragileitemtrackingapp/services/auth_methods.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

var _textStyleblack = const TextStyle(fontSize: 12.0, color: Colors.black);

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text(user?.username ?? ''),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 1.0,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.redAccent,
                              elevation: 8,
                              shadowColor: Colors.black,
                            ),
                            onPressed: () async {
                              await AuthMethods().signOut();
                            },
                            child: Text('LOGOUT', style: _textStyleblack),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          )),
    );
  }
}