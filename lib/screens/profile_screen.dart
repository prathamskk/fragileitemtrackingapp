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

var _textStyleGrey = new TextStyle(fontSize: 12.0, color: Colors.grey);

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
          child: Container(
        child: Column(
          children: <Widget>[
            Text(user?.username ?? ''),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 1.0,
                  color: Colors.grey.withOpacity(0.7),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: TextButton(
                            onPressed: () async {
                              await AuthMethods().signOut();
                            },
                            child: Text('LOGOUT', style: _textStyleGrey),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
