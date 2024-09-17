import 'package:flutter/material.dart';
import 'package:fragileitemtrackingapp/providers/user_provider.dart';
import 'package:fragileitemtrackingapp/screens/map_screen.dart';
import 'package:fragileitemtrackingapp/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:fragileitemtrackingapp/screens/new_home_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    String username = "";

  @override
  void initState() {
    super.initState();
    addData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }


  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    NewHomeScreen(),
    MapScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                // backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Map',
                // backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              // backgroundColor: Colors.green
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}